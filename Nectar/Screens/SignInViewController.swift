//
//  SignInViewController.swift
//  Nectar
//
//  Created by  User on 11.10.2022.
//

import UIKit

final class SignInViewController: UIViewController {
    
    lazy var headerMaskView: UIView = {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sign-in-header")
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        return view
    }()
    
    lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Get your groceries
        with nectar
        """
        label.numberOfLines = 0
        label.font = UIFont(name: "Gilroy-Semibold", size: 26)
        label.textColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1)
        return label
    }()
    
    lazy var numberView: UIView = {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "country-flag")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        let label = UILabel()
        label.text = "+880"
        label.font = UIFont(name: "Gilroy-Medium-", size: 18)
        label.textColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1)
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "Gilroy-Medium-", size: 18)
        textField.textColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1)
        textField.addTarget(self, action: #selector(phoneVerificationSelected(_:)), for: .editingDidBegin)
        textField.backgroundColor = .red
        
        let lineImageView = UIImageView()
        lineImageView.image = UIImage(named: "underline")
        
        [imageView, label, textField, lineImageView].forEach {
            view.addSubview($0)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(33)
            make.height.equalTo(23)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.width.equalTo(42)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(label.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(23)
        }
        
        lineImageView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    lazy var orSignLabel: UILabel = {
        let label = UILabel()
        label.text = "Or connect with social media"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "Gilroy-Semibold", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 10.0
        
        let googleButton = signInCustomButton(imageName: "google-icon",
                                              labelText: "Continue with Google",
                                              color: UIColor(red: 0.325, green: 0.514, blue: 0.925, alpha: 1))
        let facebookButton = signInCustomButton(imageName: "facebook-icon",
                                                labelText: "Continue with Facebook",
                                                color: UIColor(red: 0.29, green: 0.4, blue: 0.675, alpha: 1))
        var iter = 0
        [googleButton, facebookButton].forEach {
            $0.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview($0)
            $0.tag = iter
            iter += 1
        }
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        addSubviews()
        configConstraints()
    }
    
    private func addSubviews () {
        [headerMaskView, headingLabel, numberView, orSignLabel, buttonsStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configConstraints () {
        headerMaskView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(374)
        }
        
        headingLabel.snp.makeConstraints { make in
            make.top.equalTo(headerMaskView.snp.bottom).offset(49)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        numberView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(headingLabel.snp.bottom).offset(30)
            make.height.equalTo(39)
        }
        
        orSignLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(numberView.snp.bottom).offset(40)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(orSignLabel.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(154)
        }
    }
    
    private func signInCustomButton (imageName: String, labelText: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.layer.cornerRadius = 19
        button.clipsToBounds = true
        
        let label = UILabel()
        label.textColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        label.text = labelText
        label.font = UIFont(name: "Gilroy-Semibold", size: 18)
        label.textAlignment = .center
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        
        button.addSubview(label)
        button.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(35)
        }
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        return button
    }
    
    @objc private func signInButtonTapped (_ sender: UIButton) {
        var message = ""
        if sender.tag == 0 {
            message = "Sign In with Google"
        } else if sender.tag == 1 {
            message = "Sign In with Facebook"
        }
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func phoneVerificationSelected (_ sender: UITextField) {
        let vc = PhoneEnterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
