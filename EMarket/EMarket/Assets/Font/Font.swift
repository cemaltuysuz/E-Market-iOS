//
//  Font.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import UIKit

// MARK: - Font
final class Font {
    static func font(_ fontType: FontType, size: CGFloat) -> UIFont {
        let customFont = UIFont(name: fontType.rawValue, size: size)
        return customFont ?? UIFont.systemFont(ofSize: size)
    }
}

