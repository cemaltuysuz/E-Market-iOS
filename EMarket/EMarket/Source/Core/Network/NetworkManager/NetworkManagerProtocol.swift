//
//  NetworkManagerProtocol.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - NetworkManagerProtocol
protocol NetworkManagerProtocol {
    func sendRequest<T: Decodable>(
        request: NetworkRequest,
        completionHandler: @escaping ((NetworkResult<T?,NetworkErrorModel>) -> Void)
    )
}
