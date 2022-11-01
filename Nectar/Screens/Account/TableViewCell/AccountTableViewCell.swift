//
//  AccountTableViewCell.swift
//  Nectar
//
//  Created by  User on 26.10.2022.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    static let reuseId = "AccountTableViewCellId"
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        return label
    }()
    
    private lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.rightArrow), for: .normal)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    func configure (image: String, title: String) {
        iconImageView.image = UIImage(named: image)
        titleLabel.text = title
    }
    
    private func setUpConstraints() {
        [iconImageView, titleLabel, rightArrowButton].forEach {
            contentView.addSubview($0)
        }
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(26)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(24)
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalTo(rightArrowButton.snp.leading).offset(-10)
        }
        
        rightArrowButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-25)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
