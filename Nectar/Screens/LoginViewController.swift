//
//  LoginViewController.swift
//  Nectar
//
//  Created by  User on 12.10.2022.
//

import UIKit

class LoginViewController: TemplateViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.logoColoredCarrot)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Loging"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 26)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your emails and password"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var emailTextView: UIView = {
        let view = UnderlinedTextView(placeholder: "")
        view.setText(text: "imshuvo97@gmail.com")
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var passwordTextView: UIView = {
        let view = UnderlinedTextView(placeholder: "", textFieldType: .password)
        view.setText(text: "password")
        return view
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 14)
        label.text = "Forgot Password?"
        
        button.addSubview(label)
        label.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = CustomButton(title: "Log In", color: Asset.Colors.green)
        button.addTarget(self, action: #selector(presentShop(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInView: UIView = {
        let view = UIView()
        
        let label = UILabel()
        label.text = "Don’t have an account?"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        
        let button = UIButton()
        button.addTarget(self, action: #selector(presentSignUpScreen), for: .touchUpInside)
        
        let buttonLabel = UILabel()
        buttonLabel.text = "Sign Up"
        buttonLabel.textColor = UIColor(asset: Asset.Colors.green)
        buttonLabel.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        
        button.addSubview(buttonLabel)
        
        buttonLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.equalTo(label.snp.trailing)
            $0.top.trailing.bottom.equalToSuperview()
        }
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        [logoImageView, titleLabel, subtitleLabel, emailLabel, emailTextView, passwordLabel, passwordTextView, forgotPasswordButton, loginButton, signInView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configConstraints() {
        super.configConstraints()
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(77)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(47)
            $0.height.equalTo(55)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(100)
            $0.leading.equalToSuperview().offset(25)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(25)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(25)
        }
        
        emailTextView.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(39)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }
        
        passwordTextView.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(39)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(67)
        }
        
        signInView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(25)
            $0.height.equalTo(14)
            $0.width.equalTo(228)
        }
    }
    
    @objc func presentShop (_ sender: UIButton) {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func presentSignUpScreen (_ sender: UIButton) {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
