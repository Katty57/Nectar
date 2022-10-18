//
//  SignUpViewController.swift
//  Nectar
//
//  Created by  User on 12.10.2022.
//

import UIKit

class SignUpViewController: TemplateViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.logoColoredCarrot)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 26)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your credentials to continue"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var usernameTextView: UIView = {
        let view = UnderlinedTextView(placeholder: "")
        view.setText(text: "Afsar Hossen Shuvo")
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var emailTextView: UIView = {
        let view = UnderlinedTextView(placeholder: "", textFieldType: .email)
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
    
    private lazy var hyperlinkLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 14)
        
        var string = NSMutableAttributedString()
        let initialString = ["By continuing you agree to our", " Terms of Service", " and", " Privacy Policy."]
        
        for i in 0..<initialString.count {
            var attributes = [NSAttributedString.Key : Any]()
            if i % 2 == 0 {
                attributes = [NSAttributedString.Key.foregroundColor: UIColor(asset: Asset.Colors.subtitleGray)]
            } else {
                attributes = [NSAttributedString.Key.foregroundColor: UIColor(asset: Asset.Colors.green)]
            }
            let attributedStr = (NSAttributedString.init(string: initialString[i], attributes: attributes))
            string.append(attributedStr)
        }
        label.attributedText = string
        
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = CustomButton(title: "Sign Up", color: Asset.Colors.green)
        return button
    }()
    
    private lazy var logInView: UIView = {
        let view = UIView()
        
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        
        let button = UIButton()
        button.addTarget(self, action: #selector(presentLogInScreen), for: .touchUpInside)
        
        let buttonLabel = UILabel()
        buttonLabel.text = "Log In"
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
        
        [logoImageView, titleLabel, subtitleLabel, usernameLabel, usernameTextView, emailLabel, emailTextView, passwordLabel, passwordTextView, hyperlinkLabel, signUpButton, logInView].forEach {
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
        
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(25)
        }
        
        usernameTextView.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(39)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(usernameTextView.snp.bottom).offset(30)
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
        
        hyperlinkLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(hyperlinkLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(67)
        }
        
        logInView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signUpButton.snp.bottom).offset(25)
            $0.height.equalTo(14)
            $0.width.equalTo(241)
        }
    }
    
    @objc func presentLogInScreen (_ sender: UIButton) {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
