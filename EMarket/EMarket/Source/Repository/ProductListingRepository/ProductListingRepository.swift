//
//  ProductListingRepository.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - ProductListingRepository
protocol ProductListingRepository: BaseRepository {
    func fetchMovies(_ completionHandler: @escaping((NetworkResult<ProductListingResponse?,NetworkErrorModel>)->Void))
}


