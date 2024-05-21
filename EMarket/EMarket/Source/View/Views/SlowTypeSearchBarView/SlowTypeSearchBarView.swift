//
//  SlowTypeSearchBarView.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - SlowTypeSearchBarView
final class SlowTypeSearchBarView: BaseView {
    
    // MARK: - UI Components
    private lazy var searchBarView: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    // MARK: - Public Properties
    weak var delegate: SlowTypeSearchBarViewDelegate?
    
    var placeHolder: String? {
        get {
            return searchBarView.placeholder
        }
        set {
            self.searchBarView.placeholder = newValue
        }
    }
    
    // MARK: - Private Properties
    private var slowTyperWorkItem: DispatchWorkItem?
    
    override func setupUI() {
        super.setupUI()
        setupSearchBarUI()
    }
}

// MARK: - Setup UI
private extension SlowTypeSearchBarView {
    func setupSearchBarUI() {
        addSubview(searchBarView)
        searchBarView.pinToSuperView()
    }
}

// MARK: - UISearchBarDelegate
extension SlowTypeSearchBarView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        slowTyperWorkItem?.cancel()
        slowTyperWorkItem = nil
        
        slowTyperWorkItem = DispatchWorkItem { [weak self] in
            guard let self else { return }
            
            guard !searchText.isEmpty else {
                self.delegate?.slowTypeSearchBarView(completed: self)
                return
            }
            self.delegate?.slowTypeSearchBarView(view: self, search: searchText)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: slowTyperWorkItem!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        delegate?.slowTypeSearchBarView(completed: self)
        searchBar.setShowsCancelButton(false, animated: true)
        endEditing(true)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}
