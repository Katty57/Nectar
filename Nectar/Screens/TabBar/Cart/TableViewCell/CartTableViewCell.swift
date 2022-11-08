//
//  CartTableViewCell.swift
//  Nectar
//
//  Created by  User on 22.10.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let reuseId = "CartTableViewCellId"
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.bold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 14)
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.cross), for: .normal)
        return button
    }()
    
    private var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.minus), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(asset: Asset.Colors.minusBorderGray)?.cgColor
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        button.snp.makeConstraints {
            $0.width.equalTo(45)
        }
        return button
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()

    private var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.plus), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(asset: Asset.Colors.plusBorderGray)?.cgColor
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        button.snp.makeConstraints {
            $0.width.equalTo(45)
        }
        return button
    }()
    
    private lazy var countStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 17
        stackView.distribution = .equalSpacing
        [minusButton, countLabel, plusButton].forEach{
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    func configure (_ model: CartModel) {
        productImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = "$\(model.price)"
        countLabel.text = "\(model.count)"
    }
    
    private func setUpConstraints() {
        [productImageView, nameLabel, descriptionLabel, deleteButton, priceLabel, countStackView].forEach {
            contentView.addSubview($0)
        }
        
        productImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(30)
            $0.trailing.equalTo(nameLabel.snp.leading).offset(-30)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(100)
            $0.width.equalTo(230)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(100)
            $0.width.equalTo(230)
        }
        
        countStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(100)
            $0.width.equalTo(133)
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(14)
        }
        
        priceLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-35)
            $0.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
