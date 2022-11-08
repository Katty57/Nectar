//
//  NutritionsTableViewCell.swift
//  Nectar
//
//  Created by  User on 01.11.2022.
//

import UIKit

class NutritionsTableViewCell: UITableViewCell {
    
    static let reuseId = "NutritionsTableViewCellId"
    
    var isDetailsViewHidden: Bool {
        descriptionLabel.isHidden
    }
    
    private var arrowButtonView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.rightArrow)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var nutritionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 9)
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        return label
    }()
    
    private lazy var nutritionTextView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(asset: Asset.Colors.nutritionLightGray)
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.addSubview(nutritionLabel)
        nutritionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
        return view
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
         [titleLabel, nutritionTextView, arrowButtonView].forEach {
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(227)
            $0.bottom.equalToSuperview().offset(-9)
        }
        arrowButtonView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-6)
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
        nutritionTextView.snp.makeConstraints {
            $0.trailing.equalTo(arrowButtonView.snp.leading).offset(-20)
            $0.centerY.equalTo(arrowButtonView)
        }
        return view
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 13)
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.isHidden = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    func configure (title: String, nutrition: String, description: String) {
        titleLabel.text = title
        nutritionLabel.text = "\(nutrition)gr"
        descriptionLabel.text = description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints () {
        selectionStyle = .none
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(19)
        }
        [titleView, descriptionLabel].forEach {
            mainStackView.addArrangedSubview($0)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if isDetailsViewHidden, selected {
            UIView.animate(withDuration: 0.4) { [weak self] in
                self?.arrowButtonView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi/2)) / 180.0)
            }
            showDetailsView()
        } else {
            hideDetailsView()
            if selected {
                UIView.animate(withDuration: 0.4) { [weak self] in
                    self?.arrowButtonView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
                }
            }
        }
    }
    
    func showDetailsView () {
        descriptionLabel.isHidden = false
    }
    
    func hideDetailsView () {
        descriptionLabel.isHidden = true
    }
}

