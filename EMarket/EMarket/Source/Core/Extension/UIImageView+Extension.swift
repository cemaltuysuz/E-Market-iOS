//
//  UIImageView+Extension.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import UIKit

// MARK: - UIImageView + Extension
extension UIImageView {
    /// Load an image into the imageView from remote
    /// - Parameter urlString: String for remote address.
    public func loadImage(
        with urlString: String?
    ) {
        Image.fetchImage(from: urlString) { [weak self] image in
            guard let self else { return }
            self.image = image
        }
    }
}

