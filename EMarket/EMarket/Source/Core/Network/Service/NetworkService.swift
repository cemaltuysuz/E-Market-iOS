//
//  NetworkService.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - NetworkService
enum NetworkService {
    case mockApiBase
    
    var url: String {
        switch self {
        case .mockApiBase:
            return "https://5fc9346b2af77700165ae514.mockapi.io"
        }
    }
}
