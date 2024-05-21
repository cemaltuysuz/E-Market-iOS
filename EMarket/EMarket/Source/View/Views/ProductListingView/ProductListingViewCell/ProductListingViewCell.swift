//
//  ProductListingViewCell.swift
//  EMarket
//
//  Created by Cemal on 21.05.2024.
//

import UIKit

// MARK: - ProductListingViewCell
final class ProductListingViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    private lazy var contentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = contentVStackViewSpacing
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIColor.gray500.image()
        return imageView
    }()
    
    private lazy var productCurrentPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .blue900
        label.font = Font.font(.montRegular, size: 14.0)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = Font.font(.montMedium, size: 14.0)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue900
        
        let buttonTitle = "product_listing_view_cell.add_to_cart_button.title".localized
        let attributedString = NSMutableAttributedString(string: buttonTitle)
        attributedString.addAttribute(
            .font,
            value: Font.font(.montRegular, size: 16.0),
            range: NSRange(
                location: 0,
                length: attributedString.length
            )
        )
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.white,
            range: NSRange(
                location: 0,
                length: attributedString.length
            )
        )
        button.setAttributedTitle(attributedString, for: .normal)
        button.layerCornerRadius = 6.0
        return button
    }()
    
    // MARK: - Constants
    private let contentVStackViewSpacing: CGFloat = 15.0
    private let contentVStackViewMargin: CGFloat = 10.0
    private let currentPriceLabelHeight: CGFloat = 20.0
    private let productNameLabelMaxLabelHeight: CGFloat = 38.0
    private let addToCartButtonHeight: CGFloat = 37.0
    
    // MARK: - Private
    private var product: Product?
    
    // MARK: - Public
    weak var delegate: ProductListingViewCellDelegate?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}

// MARK: - Configure UI
extension ProductListingViewCell {
    func configure(with product: Product?) {
        self.product = product
        productImageView.loadImage(with: product?.image)
        productNameLabel.text = product?.name
        productCurrentPriceLabel.text = product?.price
    }
}

// MARK: - Setup UI
private extension ProductListingViewCell {
    func setupUI() {
        addShadowToCell()
        setupContentVStackView()
        setupProductImageView()
        setupProductCurrentPriceLabel()
        setupProductNameLabel()
        setupAddToCartButton()
    }
    
    func addShadowToCell() {
        backgroundColor = .white
        layer.shadowColor = UIColor.gray500.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        layer.masksToBounds = false
        layer.zPosition = 1
    }
    
    func setupContentVStackView() {
        addSubview(contentVStackView)
        NSLayoutConstraint.activate([
            contentVStackView.topAnchor.constraint(equalTo: topAnchor, constant: contentVStackViewMargin),
            contentVStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentVStackViewMargin),
            contentVStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentVStackViewMargin),
            contentVStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -contentVStackViewMargin)
        ])
    }
    
    func setupProductImageView() {
        contentVStackView.addArrangedSubview(productImageView)
        productImageView.heightAnchor.constraint(equalTo: contentVStackView.widthAnchor).isActive = true
    }
    
    func setupProductCurrentPriceLabel() {
        contentVStackView.addArrangedSubview(productCurrentPriceLabel)
        productCurrentPriceLabel.heightAnchor.constraint(equalToConstant: currentPriceLabelHeight).isActive = true
    }
    
    func setupProductNameLabel() {
        contentVStackView.addArrangedSubview(productNameLabel)
        productNameLabel.heightAnchor.constraint(equalToConstant: productNameLabelMaxLabelHeight).isActive = true
    }
    
    func setupAddToCartButton() {
        contentVStackView.addArrangedSubview(addToCartButton)
        addToCartButton.heightAnchor.constraint(equalToConstant: addToCartButtonHeight).isActive = true
        addToCartButton.addTarget(self, action: #selector(self.didTapAddToCartButton), for: .touchUpInside)
    }
}

// MARK: - Did Tap Handlers
@objc
private extension ProductListingViewCell {
    func didTapAddToCartButton() {
        guard let product  else { return }
        delegate?.productListingViewCell(cell: self, routeToDetailOf: product)
    }
}
