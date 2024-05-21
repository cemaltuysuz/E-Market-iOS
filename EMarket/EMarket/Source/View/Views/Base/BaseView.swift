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
    
    // MARK: - Private
    private var didTapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: BaseView.self, action: #selector(didTapView))
        return recognizer
    }()
    
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
        
        guard !isClickable else {
            addGestureRecognizer(didTapRecognizer)
            return
        }
        removeGestureRecognizer(didTapRecognizer)
    }
}

// MARK: - Handlers
@objc
private extension BaseView {
    func didTapView() {
        clickedView?()
    }
}
