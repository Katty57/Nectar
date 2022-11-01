//
//  ReviewTableViewCell.swift
//  Nectar
//
//  Created by  User on 02.11.2022.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    static let reuseId = "ReviewTableViewCellId"
    
    var isDetailsViewHidden: Bool {
        descriptionLabel.isHidden
    }
    
    private lazy var arrowButtonView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.rightArrow)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .trailing
        return stackView
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
         [titleLabel, starStackView, arrowButtonView].forEach {
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
        starStackView.snp.makeConstraints {
            $0.trailing.equalTo(arrowButtonView.snp.leading).offset(-20)
            $0.centerY.equalTo(arrowButtonView)
        }
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
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
    
    func configure (title: String, starNumber: Int, description: String) {
        titleLabel.text = title
        addStarToStackView(starNumber)
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

    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    private func addStarToStackView (_ num: Int) {
        for iter in 1...num {
            let button = UIButton()
            button.setImage(UIImage(named: "star"), for: .normal)
            button.snp.makeConstraints {
                $0.width.equalTo(14)
            }
            button.tag = iter
            starStackView.addArrangedSubview(button)
        }
    }

}
