//
//  ProductListingRepositoryImpl.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - ProductListingRepositoryImpl
final class ProductListingRepositoryImpl: ProductListingRepository {
    func fetchMovies(_ completionHandler: @escaping ((NetworkResult<ProductListingResponse?, NetworkErrorModel>) -> Void)) {
        let request = NetworkService.Product.getAllProducts.request
        networkManager.sendRequest(request: request, completionHandler: completionHandler)
    }
}
