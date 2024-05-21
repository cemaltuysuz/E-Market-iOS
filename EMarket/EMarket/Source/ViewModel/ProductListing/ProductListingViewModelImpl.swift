//
//  ProductListingViewModel.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - ProductListingViewModel
final class ProductListingViewModel: ViewModel {
    
    // MARK: - Closures
    var didProductsLoaded: ((ProductListingResponse) -> Void)?
    
    // MARK: - Private
    private let repository: ProductListingRepository = ProductListingRepositoryImpl()
    
    // MARK: - Data
    private var products: [Product] = []
    private var searchedProducts: [Product] = []
    
    func fetchProducts() {
        repository.fetchMovies { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.processProductsResponse(response)
                }
                
            case .failure(let errorModel):
                self.askRequestRepeat? {
                    self.fetchProducts()
                }
            }
        }
    }
}

// MARK: - ProductListingViewModelImpl
private extension ProductListingViewModel {
    func processProductsResponse(_ response: ProductListingResponse?) {
        let response = response ?? []
        products = response
        didProductsLoaded?(response)
    }
}
