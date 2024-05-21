//
//  BaseViewController.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import UIKit

// MARK: - BaseViewController
open class BaseViewController: UIViewController {
    
    private lazy var leftNavBarTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = Font.font(.montSemiBold, size: 24.0)
        label.text = Constant.Defaults.pageTitle
        label.textColor = .white
        return label
    }()
    
    open var pageTitle: String? {
        willSet {
            leftNavBarTitleLabel.text = newValue
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }

    private func setupUI() {
        view.backgroundColor = .viewControllerBackground
    }
}

// MARK: - Private Methods
private extension BaseViewController {
    func setupNavigationBar() {
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavBarTitleLabel)
    }
}

// MARK: - Public Methods
extension BaseViewController {
    func showAlert(
        title: String,
        description: String,
        possitiveButtonText: String,
        negativeButtonText: String? = nil,
        onClickedPossitveButton: (() -> Void)? = nil,
        onClickedNegativeButton: (() -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
            
            let possitiveAction = UIAlertAction(title: possitiveButtonText, style: .default) { _ in
                onClickedPossitveButton?()
            }
            
            alert.addAction(possitiveAction)
            if let negativeButtonText = negativeButtonText {
                let negativeAction = UIAlertAction(title: negativeButtonText, style: .cancel) { _ in
                    onClickedNegativeButton?()
                }
                alert.addAction(negativeAction)
            }
            
            alert.view.tintColor = .blue900
            self.present(alert, animated: true)
        }
    }
}
