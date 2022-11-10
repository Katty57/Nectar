//
//  FiltersTableViewCell.swift
//  Nectar
//
//  Created by  User on 28.10.2022.
//

import UIKit

class FiltersTableViewCell: UITableViewCell {
    
    static let reuseId = "FiltersTableViewCellId"
    
    private lazy var checkboxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.checkboxSelected), for: .selected)
        button.setImage(UIImage(asset: Asset.Assets.checkboxNotSelected), for: .normal)
        button.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 16)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraints()
    }
    
    private func setUpView () {
        contentView.backgroundColor = UIColor(asset: Asset.Colors.searchLightGray)
    }
    
    private func setUpConstraints () {
        [checkboxButton, titleLabel].forEach {
            contentView.addSubview($0)
        }
        checkboxButton.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(checkboxButton.snp.trailing).offset(11)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure (_ filter: String) {
        titleLabel.text = filter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func checkboxTapped (_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            titleLabel.textColor = UIColor(asset: Asset.Colors.green)
        } else {
            titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        }
    }
}
