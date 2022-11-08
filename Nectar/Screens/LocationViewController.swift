//
//  LocationViewController.swift
//  Nectar
//
//  Created by  User on 12.10.2022.
//

import UIKit

class LocationViewController: TemplateViewController {
    
    private var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.location)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Your Location"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 26)
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Swithch on your location to stay in tune with
        what’s happening in your area
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 16)
        return label
    }()
    
    private var zoneTitle: UILabel = {
        let label = UILabel()
        label.text = "Your Zone"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private var zoneView: UIView = {
        let view = UnderlinedTextView(placeholder: "", textFieldType: .list)
        view.setText(text: "Banasree")
        view.disableUserIneration()
        return view
    }()
    
    private var areaTitle: UILabel = {
        let label = UILabel()
        label.text = "Your Area"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private var areaView: UIView = {
        let view = UnderlinedTextView(placeholder: "Types of your area", textFieldType: .list)
        view.disableUserIneration()
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let button = CustomButton(title: "Submit", color: Asset.Colors.green)
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        [locationImageView, titleLabel, subtitleLabel, zoneTitle, zoneView, areaTitle, areaView, submitButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configConstraints() {
        super.configConstraints()
        
        locationImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(119)
            $0.leading.trailing.equalToSuperview().inset(94)
            $0.height.equalTo(170)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(locationImageView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(83)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(44)
        }
        
        zoneTitle.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(89)
            $0.leading.equalToSuperview().offset(25)
        }
        
        zoneView.snp.makeConstraints {
            $0.top.equalTo(zoneTitle.snp.bottom).offset(10)
            $0.leading.equalTo(zoneTitle)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(39)
        }
        
        areaTitle.snp.makeConstraints {
            $0.top.equalTo(zoneView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }
        
        areaView.snp.makeConstraints {
            $0.top.equalTo(areaTitle.snp.bottom).offset(10)
            $0.leading.equalTo(zoneTitle)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(39)
        }
        
        submitButton.snp.makeConstraints {
            $0.top.equalTo(areaView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(67)
        }
    }
    
    @objc func submitTapped (_ sender: UIButton) {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
