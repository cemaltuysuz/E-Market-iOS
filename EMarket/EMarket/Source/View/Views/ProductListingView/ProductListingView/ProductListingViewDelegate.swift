//
//  ProductListingViewDelegate.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - ProductListingViewDelegate
protocol ProductListingViewDelegate: AnyObject {
    func productListingView(view: ProductListingView, routeTo product: Product)
}
