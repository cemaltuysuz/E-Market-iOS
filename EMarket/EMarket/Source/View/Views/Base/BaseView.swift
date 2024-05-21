//
//  BaseView.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - BaseView
open class BaseView: UIView {
    
    // MARK: - Public
    open var isClickable: Bool {
        willSet {
            if isClickable != newValue { configureClickable(value: newValue) }
        }
    }
    
    open var clickedView: (()->Void)?
    
    // MARK: - Initializers
    init(
        isClickable: Bool = false
    ) {
        self.isClickable = isClickable
        super.init(frame: .zero)
        configureClickable()
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Override this method to prepare UI when view awaked.
    func setupUI() {}
}

// MARK: - Private Methods
private extension BaseView {
    func configureClickable(value: Bool? = nil) {
        let isClickable = value ?? isClickable
        isUserInteractionEnabled = isClickable
        
        guard !isClickable else {
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapView))
            addGestureRecognizer(recognizer)
            return
        }
        
        for recognizer in (gestureRecognizers ?? []) {
            removeGestureRecognizer(recognizer)
        }
    }
}

// MARK: - Handlers
@objc
private extension BaseView {
    func didTapView() {
        clickedView?()
    }
}
