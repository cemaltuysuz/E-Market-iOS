//
//  ProductListingViewController.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import UIKit

// MARK: - ProductListingViewController
final class ProductListingViewController: ViewController<ProductListingViewModel> {

    // MARK: - UI Components
    private lazy var searchBarView: SlowTypeSearchBarView = {
        let searchBarView = SlowTypeSearchBarView()
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.delegate = self
        searchBarView.placeHolder = "product_listing.search_bar.placeholder_text".localized
        return searchBarView
    }()
    
    private lazy var productListingView: ProductListingView = {
        let productListingView = ProductListingView()
        productListingView.translatesAutoresizingMaskIntoConstraints = false
        productListingView.delegate = self
        return productListingView
    }()
    
    // MARK: - Constants
    private let searchBarHeight: CGFloat = 40.0
    private let pageMargin: CGFloat = 12.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Setup UI
private extension ProductListingViewController {
    func setupUI() {
        setupSearchBarView()
        setupProductListingView()
    }
    
    func setupSearchBarView() {
        view.addSubview(searchBarView)
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: pageMargin),
            searchBarView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: pageMargin),
            searchBarView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -pageMargin),
            searchBarView.heightAnchor.constraint(equalToConstant: searchBarHeight)
        ])
    }
    
    func setupProductListingView() {
        view.addSubview(productListingView)
        NSLayoutConstraint.activate([
            productListingView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: pageMargin),
            productListingView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: pageMargin),
            productListingView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -pageMargin),
            productListingView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -pageMargin)
        ])
    }
}

// MARK: - SlowTypeSearchBarViewDelegate
extension ProductListingViewController: SlowTypeSearchBarViewDelegate {
    func slowTypeSearchBarView(view: SlowTypeSearchBarView, search text: String) {
        // TODO: - Did Search
    }
    
    func slowTypeSearchBarView(completed view: SlowTypeSearchBarView) {
        // TODO: - Did Complete
    }
}

// MARK: - ProductListingViewDelegate
extension ProductListingViewController: ProductListingViewDelegate {
    func productListingView(view: ProductListingView, routeTo product: Product) {
        // TODO: - Route to product detail page
    }
}
