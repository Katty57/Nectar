//
//  HomeHeaderTableViewCell.swift
//  Nectar
//
//  Created by  User on 20.10.2022.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {
    
    static var reuseId = "HomeTableViewCellHeaderId"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 24)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        return label
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.text = "See all"
        label.textAlignment = .center
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.green)
        button.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints () {
        [titleLabel, rightButton].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.width.equalTo(304)
        }
        rightButton.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
        }
    }
    
    func configure (text: String) {
        titleLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
