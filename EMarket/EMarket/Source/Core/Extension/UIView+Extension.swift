//
//  UIView+Extension.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - UIView + SafeArea
extension UIView {
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }
    var safeTopAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }
}

// MARK: - NSLayoutConstraint
extension UIView {
    func pinToSuperView() {
        guard let superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeTopAnchor),
            leadingAnchor.constraint(equalTo: superview.safeLeadingAnchor),
            trailingAnchor.constraint(equalTo: superview.safeTrailingAnchor),
            bottomAnchor.constraint(equalTo: superview.safeBottomAnchor)
        ])
    }
}
