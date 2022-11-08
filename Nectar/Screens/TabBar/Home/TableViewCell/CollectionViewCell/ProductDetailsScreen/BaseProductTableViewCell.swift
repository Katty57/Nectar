//
//  BaseProductTableViewCell.swift
//  Nectar
//
//  Created by  User on 01.11.2022.
//

import UIKit

class BaseProductTableViewCell: UITableViewCell {

    var isDetailsViewHidden: Bool {
        descriptionView.isHidden
    }
    
    private var arrowButtonView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.rightArrow)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
         [titleLabel, arrowButtonView].forEach {
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(227)
            $0.bottom.equalToSuperview().offset(-9)
        }
        arrowButtonView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
        return view
    }()
    
    var descriptionView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints () {
        selectionStyle = .none
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(19)
        }
        [titleView, descriptionView].forEach {
            mainStackView.addArrangedSubview($0)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if isDetailsViewHidden, selected {
            UIView.animate(withDuration: 0.4) { [weak self] in
                self?.arrowButtonView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            }
            showDetailsView()
        } else {
            hideDetailsView()
            if selected {
                UIView.animate(withDuration: 0.4) { [weak self] in
                    self?.arrowButtonView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
                }
            }
        }
    }
    
    func showDetailsView () {
        descriptionView.isHidden = false
    }
    
    func hideDetailsView () {
        descriptionView.isHidden = true
    }
}
