//
//  BaseNavigationController.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - BaseNavigationController
open class BaseNavigationController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Setup UI
private extension BaseNavigationController {
    func setupUI() {
        navigationBar.prefersLargeTitles = false
        navigationBar.backgroundColor = .blue900
        
        let backButtonImage = Image.load(library: .icBack)
        navigationBar.backIndicatorImage = backButtonImage
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage

    }
}
