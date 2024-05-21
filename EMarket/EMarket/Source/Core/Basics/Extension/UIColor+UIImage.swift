//
//  UIColor+UIImage.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - UIColor+UIImage
extension UIColor {
    /// Get solid colored image
    /// - Parameter size: CGSize value to create image with spesific size
    /// - Returns: Solid colored Image
    func image(
        _ size: CGSize = CGSize(width: 1, height: 1)
    ) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
