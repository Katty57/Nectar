//
//  ExploreCollectionViewCell.swift
//  Nectar
//
//  Created by  User on 21.10.2022.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "ExploreCollectionViewCellId"
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(font: FontFamily.Gilroy.bold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (_ model: ExploreModel) {
        imageView.image = UIImage(named: "\(model.image)")
        titleLabel.text = "\(model.title)"
        let color = model.backgoundColor.hexColor
        layer.borderColor = color.withAlphaComponent(0.75).cgColor
        backgroundColor = color.withAlphaComponent(0.25)
    }
    
    private func setUpView() {
        clipsToBounds = true
        layer.cornerRadius = 18
        layer.borderWidth = 1
    }
    
    private func setUpConstraints() {
        [imageView, titleLabel].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().offset(-15)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(titleLabel.snp.top).offset(-15)
        }
    }
}
