//
//  MainTabBarController.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import UIKit

// MARK: - MainTabBarController
final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarAppearance()
        configureTabBar()
    }
}

// MARK: - Setup UI
private extension MainTabBarController {
    final func configureTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowRadius = 0
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 1
    }
    
    final func configureTabBar() {
        let productListingVC = ProductListingViewController(viewModel: ProductListingViewModel())
        productListingVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Image.load(library: .icHome),
            selectedImage: nil
        )
        
        let basketVC = BasketViewController(viewModel: BasketViewModel())
        basketVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Image.load(library: .icBasket),
            selectedImage: nil
        )
        
        viewControllers = [
            BaseNavigationController(rootViewController: productListingVC),
            BaseNavigationController(rootViewController: basketVC)
        ]
    }
}
