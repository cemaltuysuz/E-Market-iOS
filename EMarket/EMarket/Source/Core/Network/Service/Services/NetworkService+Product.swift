//
//  NetworkService+Product.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - NetworkService+Product
extension NetworkService {
    enum Product {
        case getAllProducts
        
        var request: NetworkRequest {
            switch self {
            case .getAllProducts:
                let url = NetworkService.mockApiBase.url + "/products"
                let config = NetworkServiceConfig(httpMethod: .get, url: url)
                return NetworkRequest(serviceConfig: config)
            }
        }
    }
}
