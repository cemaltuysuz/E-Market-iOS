//
//  ViewController.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - ViewController
open class ViewController<T: ViewModel>: BaseViewController {
    
    var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureBaseBindings()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBaseBindings() {
        viewModel.askRequestRepeat = {[weak self] shouldRepeat in
            self?.showAlert(title: "general.error".localized,
                            description: "network.error.try_again".localized,
                            possitiveButtonText: "general.yes".localized,
                            negativeButtonText: "general.no".localized,
                            onClickedPossitveButton: {
                shouldRepeat()
            })
        }
        
        viewModel.onErrorReceived = {[weak self] error in
            self?.showAlert(title: "general.error".localized,
                            description: "network.error".localized,
                            possitiveButtonText: "general.close".localized)
        }
    }
}

