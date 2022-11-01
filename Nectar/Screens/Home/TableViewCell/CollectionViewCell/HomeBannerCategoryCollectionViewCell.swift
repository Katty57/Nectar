//
//  HomeCategoryBannerCollectionViewCell.swift
//  Nectar
//
//  Created by  User on 27.10.2022.
//

import UIKit

class HomeBannerCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "HomeBannerCategoryCollectionViewCellId"
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 20)
        label.textColor = UIColor(asset: Asset.Colors.homeCategoryBannerTitleGray)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (_ category: HomeBannerCategory) {
        categoryImageView.image = UIImage(named: category.image)
        categoryTitleLabel.text = category.title
        backgroundColor = category.color.hexColor.withAlphaComponent(0.15)
    }
    
    private func setUpView () {
        layer.cornerRadius = 18
        clipsToBounds = true
    }
    
    private func configConstraints () {
        contentView.addSubview(categoryTitleLabel)
        contentView.addSubview(categoryImageView)
        
        categoryImageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(15)
            $0.width.equalTo(71)
        }
        categoryTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(categoryImageView.snp.trailing).offset(15)
        }
    }
}
