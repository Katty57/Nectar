//
//  FavouriteTableViewCell.swift
//  Nectar
//
//  Created by  User on 25.10.2022.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    static let reuseId = "FavouriteTableViewCellId"
    
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
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        return label
    }()
    
    private var arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.rightArrow), for: .normal)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    func configure (_ model: FavouriteModel) {
        productImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = "$\(model.price)"
    }
    
    private func setUpConstraints() {
        [productImageView, nameLabel, descriptionLabel, priceLabel, arrowButton].forEach {
            contentView.addSubview($0)
        }
        
        arrowButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalTo(arrowButton.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.trailing.equalTo(priceLabel.snp.leading).offset(-10)
            $0.width.equalTo(210)
            $0.top.equalToSuperview().offset(37)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.trailing.equalTo(priceLabel.snp.leading).offset(-10)
            $0.width.equalTo(210)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        productImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(descriptionLabel.snp.leading).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
