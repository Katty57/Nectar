//
//  CustomButton.swift
//  Nectar
//
//  Created by  User on 17.10.2022.
//

import UIKit

class CustomButton: UIButton {
    
    private lazy var customTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.textColor = UIColor(asset: Asset.Colors.buttonTitle)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init (title: String, color: ColorAsset) {
        super.init(frame: .zero)
        
        setUpButton(title: title, color: color)
        setUpConstraints()
    }
    
    init (title: String, color: ColorAsset, imageName: ImageAsset) {
        super.init(frame: .zero)
        
        setUpButtonWithImage(title: title, color: color, imageName: imageName)
        setUpConstraintsWithImage()
    }
    
    private func setUpButton (title: String, color: ColorAsset) {
        self.customTitleLabel.text = title
        self.backgroundColor = UIColor(asset: color)
        
        self.layer.cornerRadius = 19
        self.clipsToBounds = true
    }
    
    private func setUpButtonWithImage (title: String, color: ColorAsset, imageName: ImageAsset) {
        setUpButton(title: title, color: color)
        self.rightImageView.image = UIImage(asset: imageName)
    }
    
    private func setUpConstraints () {
        self.addSubview(customTitleLabel)
        
        customTitleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setUpConstraintsWithImage () {
        self.addSubview(customTitleLabel)
        self.addSubview(rightImageView)
        
        rightImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(35)
            $0.width.equalTo(22)
            $0.height.equalTo(24)
        }
        customTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(rightImageView.snp.trailing)
            $0.trailing.equalToSuperview().inset(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTitleColor (color: UIColor) {
        customTitleLabel.textColor = color
    }
}
