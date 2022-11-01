//
//  OrderFailedViewController.swift
//  Nectar
//
//  Created by  User on 27.10.2022.
//

import UIKit

class OrderFailedViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.cross), for: .normal)
        button.addTarget(self, action: #selector(backHome(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.orderFailed)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 28)
        label.text = "Oops! Order Failed"
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 16)
        label.text = "Something went tembly wrong."
        label.textAlignment = .center
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var tryAgainButton: UIButton = {
        let button = CustomButton(title: "Please Try Again", color: Asset.Colors.green)
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
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.layer.cornerRadius = 18
        mainView.clipsToBounds = true
        mainView.backgroundColor = .white
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpConstraints()
    }
    
    private func setUpView () {
        view.backgroundColor = .black.withAlphaComponent(0.4)
    }
    
    private func setUpConstraints () {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        [closeButton, mainImageView, titleLabel, subtitleLabel, tryAgainButton, backHomeButton].forEach {
            mainView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(184)
            $0.bottom.equalToSuperview().offset(-109)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        mainView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(364)
            $0.height.equalTo(601)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.leading.equalToSuperview().offset(25)
            $0.width.height.equalTo(15)
        }
        mainImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(222)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(49)
            $0.leading.trailing.equalToSuperview().inset(59)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(67)
        }
        tryAgainButton.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(67)
        }
        backHomeButton.snp.makeConstraints {
            $0.top.equalTo(tryAgainButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(124)
            $0.height.equalTo(18)
        }
    }
    
    @objc private func backHome (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
