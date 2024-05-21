//
//  Product.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation

// MARK: - ProductListingResponse
typealias ProductListingResponse = [Product]

// MARK: - Product
struct Product: Decodable {
    let id: String?
    let name: String?
    let image: String?
    let price: String?
    let description: String?
    let model: String?
    let brand: String?
    let createdAt: String?
}
