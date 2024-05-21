//
//  UICollectionView+Extension.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - UICollectionView+Extension
extension UICollectionView {
    /// Register a collectionCell into the CollectionView
    /// - Parameter type: UICollectionViewCell type
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        let identity = String.init(describing: type.self)
        self.register(type, forCellWithReuseIdentifier: identity)
    }
    /// Dequeue an already registered UICollectionViewCell
    /// - Parameters:
    ///   - cellType: UICollectionViewCell type value to dequeue
    ///   - indexPath: IndexPath value for UICollectionViewCell
    /// - Returns: Requested UICollectionViewCell
    func dequeue<T: UICollectionViewCell>(_ cellType: T.Type, indexPath: IndexPath) -> T {
        let identity = String.init(describing: cellType.self)
        return dequeueReusableCell(withReuseIdentifier: identity, for: indexPath) as! T
    }
}
