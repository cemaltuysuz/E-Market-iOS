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
    
    // MARK: - Constants
    private let searchBarHeight: CGFloat = 40.0
    private let searchBarMargin: CGFloat = 12.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Setup UI
private extension ProductListingViewController {
    func setupUI() {
        setupSearchBarView()
    }
    
    func setupSearchBarView() {
        view.addSubview(searchBarView)
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: searchBarMargin),
            searchBarView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: searchBarMargin),
            searchBarView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -searchBarMargin),
            searchBarView.heightAnchor.constraint(equalToConstant: searchBarHeight)
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
