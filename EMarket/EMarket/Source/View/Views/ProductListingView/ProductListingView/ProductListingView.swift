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
    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = productCellMargin
        layout.minimumLineSpacing = productCellMargin
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductListingViewCell.self)
        collectionView.contentInset = .init(top: collectionViewInset, left: collectionViewInset, bottom: collectionViewInset, right: collectionViewInset)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Constants
    private let singleLineProductCount: Int
    private let productCellMargin: CGFloat = 15.0
    private let cellHeightRatio: CGFloat = 1.776
    private let collectionViewInset: CGFloat = 5.0
    
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
    func configure(with products: [Product]) {
        self.products = products
        productsCollectionView.reloadData()
    }
}

// MARK: - Setup UI
private extension ProductListingView {
    func setupProductsCollectionView() {
        addSubview(productsCollectionView)
        productsCollectionView.frame = frame
        NSLayoutConstraint.activate([
            productsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: collectionViewInset),
            productsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -collectionViewInset),
            productsCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: collectionViewInset),
            productsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -collectionViewInset)
        ])
        productsCollectionView.layoutIfNeeded()
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
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let totalSpacing = ((CGFloat(singleLineProductCount - 1) * productCellMargin)) + (CGFloat(singleLineProductCount + 1) * collectionViewInset)
        let width = (collectionView.frame.width - totalSpacing) / CGFloat(singleLineProductCount)
        let height = CGFloat(width * cellHeightRatio)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = products[safe: indexPath.row] else { return }
        // TODO: Route to product detail page
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}
