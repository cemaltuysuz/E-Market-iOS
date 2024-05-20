//
//  NetworkRequest.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - NetworkRequest
struct NetworkRequest {
    let serviceConfig: NetworkServiceConfig
    let urlParams: [String: String]?
    let timeOut: TimeInterval
    
    init(serviceConfig: NetworkServiceConfig,
         urlParams: [String: String]? = nil,
         timeOut: TimeInterval = 60.0) {
        self.serviceConfig = serviceConfig
        self.urlParams = urlParams
        self.timeOut = timeOut
    }
}
