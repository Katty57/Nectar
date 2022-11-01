//
//  BannerCollectionViewCell.swift
//  Nectar
//
//  Created by  User on 20.10.2022.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "BannerCollectionViewCellId"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Aclonica.regular, size: 20)
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (_ model: HomeBanner) {
        self.imageView.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
    }
    
    private func setUpView () {
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    }
    
    private func configConstraints () {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36)
            $0.leading.equalToSuperview().offset(146)
        }
    }
}
