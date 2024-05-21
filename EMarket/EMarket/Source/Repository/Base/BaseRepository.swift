//
//  BaseRepository.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - BaseRepository
protocol BaseRepository: AnyObject {
    var networkManager: NetworkManagerProtocol { get }
}

extension BaseRepository {
    var networkManager: NetworkManagerProtocol {
        return NetworkManager.shared
    }
}
