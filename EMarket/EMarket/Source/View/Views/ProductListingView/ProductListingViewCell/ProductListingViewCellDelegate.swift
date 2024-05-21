//
//  ProductListingViewCellDelegate.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - ProductListingViewCellDelegate
protocol ProductListingViewCellDelegate: AnyObject {
    func productListingViewCell(cell: ProductListingViewCell, routeToDetailOf product: Product)
}
