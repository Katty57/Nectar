//
//  HomeProductCollectionViewCell.swift
//  Nectar
//
//  Created by  User on 20.10.2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "ProductCollectionViewCellId"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.font = UIFont(font: FontFamily.Gilroy.bold, size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 17
        button.backgroundColor = UIColor(asset: Asset.Colors.green)
        button.setImage(UIImage(asset: Asset.Assets.addToCart), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    func configure (_ model: Product) {
        imageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = "$\(model.price)"
    }
    
    private func setUpView () {
        layer.cornerRadius = 18
        layer.borderWidth = 1
        layer.borderColor = UIColor(asset: Asset.Colors.productCellBorderGray)?.cgColor
    }
    
    private func setUpConstraints () {
        [imageView, nameLabel, descriptionLabel, priceLabel, addToCartButton].forEach {
            addSubview($0)
        }
        
        addToCartButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(14)
            $0.height.width.equalTo(45)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalTo(addToCartButton.snp.centerY)
            $0.trailing.equalTo(addToCartButton.snp.leading).offset(-10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(addToCartButton.snp.top).offset(-1)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-2)
        }
        
        imageView.snp.makeConstraints {
            $0.bottom.equalTo(nameLabel.snp.top).offset(-18)
            $0.top.leading.trailing.equalToSuperview().inset(18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
