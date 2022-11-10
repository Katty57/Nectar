//
//  VerificationViewController.swift
//  Nectar
//
//  Created by  User on 12.10.2022.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your 4-digit code"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 26)
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Code"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private var codeView: UIView = {
        let view = UnderlinedTextView(placeholder: "")
        view.setCodeTextField()
        view.setNumberKeyboard()
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.nextButton), for: .normal)
        button.addTarget(self, action: #selector(codeEntered), for: .touchUpInside)
        return button
    }()
    
    private lazy var resendButton: UIButton = {
        let button = UIButton()
    
        let label = UILabel()
        label.text = "Resend Code"
        label.textColor = UIColor(asset: Asset.Colors.green)
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 18)
        
        button.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        addSubviews()
        configConstraints()
        addKeyboardObserver()
        addGesture()
    }
    
    private func setUpView() {
        view.backgroundColor = UIColor(asset: Asset.Colors.lightGray)
        
        let leftBarButton = UIBarButtonItem(image: UIImage(asset: Asset.Assets.backButton), style: .plain, target: self, action: #selector(popToPrevious))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func addKeyboardObserver () {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func addGesture () {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func addSubviews() {
        [titleLabel, subtitleLabel, resendButton, codeView, nextButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func configConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.leading.equalToSuperview().offset(25)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(25)
        }
        
        codeView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(39)
        }
        
        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-80)
            $0.height.width.equalTo(67)
        }
        
        resendButton.snp.makeConstraints {
            $0.centerY.equalTo(nextButton.snp.centerY)
            $0.leading.equalToSuperview().offset(25)
            $0.width.equalTo(112)
        }
    }
    
    @objc private func popToPrevious (_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func codeEntered (_ sender: UIButton) {
        let vc = LocationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = keyboardSize.height + 20
            nextButton.snp.remakeConstraints {
                $0.bottom.equalToSuperview().offset(-height)
                $0.trailing.equalToSuperview().offset(-24)
                $0.height.width.equalTo(67)
            }
        }
    }

    @objc private func keyboardWillHide(_ notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            nextButton.snp.remakeConstraints {
                $0.bottom.equalToSuperview().offset(-80)
                $0.trailing.equalToSuperview().offset(-24)
                $0.height.width.equalTo(67)
            }
        }
    }
}
