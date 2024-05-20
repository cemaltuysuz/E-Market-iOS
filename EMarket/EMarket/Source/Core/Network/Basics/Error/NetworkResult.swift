//
//  NetworkResult.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - NetworkResult
public enum NetworkResult<Success,Failure> where Failure: NetworkErrorModelResponseable{
    case success(Success)
    case failure(Failure)
}
