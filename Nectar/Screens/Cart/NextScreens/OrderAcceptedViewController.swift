//
//  OrderAcceptedViewController.swift
//  Nectar
//
//  Created by  User on 27.10.2022.
//

import UIKit

class OrderAcceptedViewController: TemplateViewController {
    
    private lazy var orderAcceptedImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.orderAccepted)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 28)
        label.text = "Your Order has been accepted"
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 16)
        label.text = "Your items has been placcd and is on it’s way to being processed"
        label.textAlignment = .center
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var trackOrderButton: UIButton = {
        let button = CustomButton(title: "Track Order", color: Asset.Colors.green)
        button.addTarget(self, action: #selector(trackOrder(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var backHomeButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.text = "Back to home"
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        button.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        button.addTarget(self, action: #selector(backHome(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configConstraints () {
        super.configConstraints()
        
        [orderAcceptedImageVIew, titleLabel, subtitleLabel, trackOrderButton, backHomeButton].forEach {
            contentView.addSubview($0)
        }
        
        orderAcceptedImageVIew.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(58)
            $0.top.equalToSuperview().offset(151)
            $0.width.equalTo(269)
            $0.height.equalTo(240)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(orderAcceptedImageVIew.snp.bottom).offset(66)
            $0.width.equalTo(265)
        }
        subtitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.width.equalTo(278)
        }
        trackOrderButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(134)
            $0.height.equalTo(67)
        }
        backHomeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(trackOrderButton.snp.bottom).offset(24)
            $0.bottom.equalToSuperview().offset(-62)
            $0.height.equalTo(18)
        }
    }
    
    @objc private func backHome (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func trackOrder (_ sender: UIButton) {
        let vc = OrderFailedViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
//        dismiss(animated: false, completion: nil)
    }
}
