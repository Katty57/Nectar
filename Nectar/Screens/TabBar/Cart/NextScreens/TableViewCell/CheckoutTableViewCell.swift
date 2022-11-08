//
//  CheckoutTableViewCell.swift
//  Nectar
//
//  Created by  User on 28.10.2022.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    
    static let reuseId = "CheckoutTableViewCellId"
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        return label
    }()
    
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.text = ""
        return label
    }()
    
    private var valueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private var rightArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.rightArrow), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (_ model: Checkout) {
        titleLabel.text = model.title
        if let text = model.value {
            valueLabel.text = text
            valueImageView.isHidden = true
            valueLabel.isHidden = false
            
        } else if let image = model.image {
            valueImageView.image = UIImage(named: image)
            valueLabel.isHidden = true
            valueImageView.isHidden = false
        }
    }
    
    private func setUpConstraints () {
        [titleLabel, valueLabel, valueImageView, rightArrowButton].forEach {
            contentView.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.width.equalTo(150)
        }
        rightArrowButton.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
        valueImageView.snp.makeConstraints {
            $0.trailing.equalTo(rightArrowButton.snp.leading).offset(-15)
            $0.width.equalTo(21)
            $0.height.equalTo(16)
            $0.centerY.equalToSuperview()
        }
        valueLabel.snp.makeConstraints {
            $0.trailing.equalTo(rightArrowButton.snp.leading).offset(-15)
            $0.centerY.equalToSuperview()
        }
    }

}
