//
//  NetworkError.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - NetworkError
public enum NetworkError: Int, Error {
    case bussinessError = 100
    case invalidURL = 101
    case failedResponse = 102
    case parseError = 103
    case emptyContent = 104
}
