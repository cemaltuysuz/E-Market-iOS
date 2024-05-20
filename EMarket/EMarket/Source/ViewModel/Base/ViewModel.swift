//
//  ViewModel.swift
//  EMarket
//
//  Created by Cemal on 20.05.2024.
//

import Foundation

// MARK: - ViewModel
open class ViewModel {
    var onErrorReceived: ((NetworkErrorModel) ->Void)?
    var askRequestRepeat: ((@escaping(()-> Void)) -> Void)?
}
