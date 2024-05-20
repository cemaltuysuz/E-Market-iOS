//
//  NetworkErrorModel.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - NetworkErrorModelResponseable
public protocol NetworkErrorModelResponseable: Codable{
    var message: String?{get set}
    var errorCode: Int?{get set}
}

// MARK: - NetworkErrorModel
public struct NetworkErrorModel: NetworkErrorModelResponseable {

    public var message: String?
    public var errorCode: Int?
    
    public init(message: String? = nil, errorCode: Int? = nil) {
        self.message = message
        self.errorCode = errorCode
    }
    
    public init(with error: NetworkError, message: String){
        errorCode = error.rawValue
        self.message = message
    }
}

// MARK: - NetworkErrorModel
public extension NetworkErrorModel{
    var errorType: NetworkError{
        guard let code = errorCode, let error = NetworkError.init(rawValue: code) else{
            return .bussinessError
        }
        return error
    }
}

// MARK: - NetworkErrorModel
public extension NetworkErrorModel{
    var canRequestRepeatable: Bool {
        errorType == .emptyContent || errorType == .failedResponse || errorType == .parseError
    }
}
