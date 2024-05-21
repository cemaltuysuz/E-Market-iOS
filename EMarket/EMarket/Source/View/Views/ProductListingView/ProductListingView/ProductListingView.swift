//
//  ProductListingView.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - ProductListingView
final class ProductListingView: BaseView {
    
    // MARK: - UI Components
    private var productsCollectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    
    // MARK: - Constants
    private let singleLineProductCount: Int
    private let productCellMargin: CGFloat = 15.0
    private let cellHeightRatio: CGFloat = 1.776
    
    // MARK: - Data
    private var products: [Product] = []
    
    // MARK: - Public
    weak var delegate: ProductListingViewDelegate?
    
    
    // MARK: - Initializers
    init(singleLineProductCount: Int = 2) {
        self.singleLineProductCount = singleLineProductCount
        super.init()
    }
    
    override func setupUI() {
        super.setupUI()
        setupProductsCollectionView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI
extension ProductListingView {
    func configure(with productList: [Product]) {
        
    }
}

// MARK: - Setup UI
private extension ProductListingView {
    func setupProductsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = productCellMargin
        layout.minimumLineSpacing = productCellMargin
        productsCollectionView.collectionViewLayout = layout
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(ProductListingViewCell.self)
        setupConstraintsOfProductsCollectionView()
    }
    
    func setupConstraintsOfProductsCollectionView() {
        addSubview(productsCollectionView)
        productsCollectionView.pinToSuperView()
    }
}

extension ProductListingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(ProductListingViewCell.self, indexPath: indexPath)
        let product = products[safe: indexPath.row]
        cell.configure(with: product)
        return cell
    }
}

extension ProductListingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (CGFloat(singleLineProductCount - 1) * productCellMargin)
        let width = (collectionView.frame.width - totalSpacing) / CGFloat(singleLineProductCount)
        let height = CGFloat(width * cellHeightRatio)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = products[safe: indexPath.row] else { return }
        // TODO: Route to product detail page
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard
//            viewModel.totalCount > collectionView.visibleCells.count,
//            indexPath.row > viewModel.movies.count - 2
//        else {
//            return
//        }
//        viewModel.fetchMovies(with: searchBar.text ?? "", isNextPage: true)
    }
}
