//
//  SignInViewController.swift
//  Nectar
//
//  Created by  User on 11.10.2022.
//

import UIKit

final class SignInViewController: UIViewController {
    
    private var coordinator: SignInCoordinator
    
    private var headerMaskImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.signInHeader)
        return imageView
    }()
    
    private var headingLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Get your groceries
        with nectar
        """
        label.numberOfLines = 0
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 26)
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        return label
    }()
    
    private lazy var numberView: UIView = {
        let view = UnderlinedTextView(placeholder: "", imageName: Asset.Assets.countryFlag, labelText: "+880")
        view.disableUserIneration()
        view.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(phoneVerificationSelected(_:)))
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    private var orSignLabel: UILabel = {
        let label = UILabel()
        label.text = "Or connect with social media"
        label.textColor = UIColor(asset: Asset.Colors.darkGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        label.textAlignment = .center
        return label
    }()
    
    private var buttonsStackView: UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 10.0
        
        let googleButton = CustomButton(title: "Continue with Google", color: Asset.Colors.googleButtonColor, imageName: Asset.Assets.googleIcon)
        let facebookButton = CustomButton(title: "Continue with Facebook", color: Asset.Colors.facebookButtonColor, imageName: Asset.Assets.facebookIcon)
        
        var iter = 0
        [googleButton, facebookButton].forEach {
            $0.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview($0)
            $0.tag = iter
            iter += 1
        }
        
        return stackView
    }()
    
    init (coordinator: SignInCoordinator) {
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        addSubviews()
        configConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViewAgain()
    }
    
    private func setUpView () {
        view.backgroundColor = UIColor(asset: Asset.Colors.lightGray)
    }
    
    private func setUpViewAgain () {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func addSubviews () {
        [headerMaskImageView, headingLabel, numberView, orSignLabel, buttonsStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configConstraints () {
        headerMaskImageView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalTo(374)
        }
        
        headingLabel.snp.makeConstraints {
            $0.top.equalTo(headerMaskImageView.snp.bottom).offset(49)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        numberView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.top.equalTo(headingLabel.snp.bottom).offset(30)
            $0.height.equalTo(39)
        }
        
        orSignLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.top.equalTo(numberView.snp.bottom).offset(40)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.top.equalTo(orSignLabel.snp.bottom).offset(37)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(154)
        }
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
    
    @objc private func phoneVerificationSelected (_ sender: UITapGestureRecognizer) {
        coordinator.signInTypeSelected(with: .phone)
    }
}
