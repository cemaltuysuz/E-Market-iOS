//
//  Image.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import UIKit
import Kingfisher

// MARK: - Image
final class Image {
    /// Fetch an image from remote
    /// - Parameters:
    ///   - url: String value for remote address.
    ///   - completionHandler: CompletionBlock to give requested image when loaded
    static func fetchImage(
        from url: String?,
        completionHandler: @escaping ((UIImage?)->Void)
    ) {
        guard let imageUrlStr = url,
              let imageUrl = URL(string: imageUrlStr) else {
            completionHandler(nil)
            return
        }
        
        KingfisherManager.shared.retrieveImage(with: imageUrl) { result in
            switch result {
            case .success(let value):
                let image = value.image
                completionHandler(image)
            case .failure(let error):
                completionHandler(nil)
            }
        }
    }
}
