//
//  SlowTypeSearchBarViewDelegate.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import Foundation
 
// MARK: - SlowTypeSearchBarViewDelegate
protocol SlowTypeSearchBarViewDelegate: AnyObject {
    func slowTypeSearchBarView(view: SlowTypeSearchBarView, search text: String)
    func slowTypeSearchBarView(completed view: SlowTypeSearchBarView)
}
