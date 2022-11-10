//
//  UnderlinedTextView.swift
//  Nectar
//
//  Created by  User on 17.10.2022.
//

import UIKit

enum TextFieldType {
    case email, password, list
}

class UnderlinedTextView: UIView {
    
    var activeTextField : UITextField? = nil
    
    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 18)
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        return label
    }()
    
    private var infoTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor(asset: Asset.Colors.titleBlack)
        textField.font = UIFont(font: FontFamily.Gilroy.medium, size: 18)
        return textField
    }()
    
    private var lineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.underline)
        return imageView
    }()
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        return button
    }()

    init (placeholder: String) {
        super.init(frame: .zero)
        
        setUpView(placeholder: placeholder)
        configConstraints()
    }
    
    init (placeholder: String, imageName: ImageAsset, labelText: String) {
        super.init(frame: .zero)
        
        setUpViewWith(rightImage: imageName, labelText: labelText)
        configConstraintsWithRightContent()
    }
    
    init (placeholder: String, textFieldType: TextFieldType) {
        super.init(frame: .zero)
        
        setUpView(placeholder: placeholder)
        switch textFieldType {
        case .email:
            setLeftButton(imageName: Asset.Assets.checkmark)
            addTextChecker()
        case .password:
            setSecuredButton()
        case .list:
            setLeftButton(imageName: Asset.Assets.chevronDown)
        }
        configConstraints()
    }
    
    func setText (text: String) {
        self.infoTextField.text = text
    }
    
    func setNumberKeyboard () {
        self.infoTextField.keyboardType = .numberPad
    }
    
    func disableUserIneration () {
        self.infoTextField.isUserInteractionEnabled = false
    }
    
    private func setUpView (placeholder: String) {
        self.infoTextField.placeholder = placeholder
    }
    
    private func setUpViewWith (rightImage: ImageAsset, labelText: String) {
        self.rightImageView.image = UIImage(asset: rightImage)
        self.rightLabel.text = labelText
    }
    
    private func setLeftButton (imageName: ImageAsset) {
        leftButton.setImage(UIImage(asset: imageName), for: .normal)
        infoTextField.rightView = leftButton
        infoTextField.rightViewMode = .always
    }
    
    private func setSecuredButton () {
        infoTextField.isSecureTextEntry = true
        infoTextField.addSecureTextButton()
    }
    
    private func configConstraints () {
        [infoTextField, lineImageView].forEach {
            addSubview($0)
        }
        
        infoTextField.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        lineImageView.snp.makeConstraints {
            $0.top.equalTo(infoTextField.snp.bottom).offset(9)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configConstraintsWithRightContent () {
        [rightImageView, rightLabel, infoTextField, lineImageView].forEach {
            addSubview($0)
        }
        
        rightImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(23)
        }
        
        rightLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(rightImageView.snp.trailing).offset(12)
            $0.width.equalTo(42)
        }
        
        infoTextField.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(rightLabel.snp.trailing).offset(12)
            $0.height.equalTo(23)
        }
        
        lineImageView.snp.makeConstraints {
            $0.top.equalTo(rightImageView.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnderlinedTextView {
    
    func setCodeTextField () {
        rightLabel.text = "- - - -"
        addSubview(rightLabel)
        rightLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(29)
        }
        infoTextField.textColor = .clear
        infoTextField.backgroundColor = .clear
        
        infoTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange (_ textField: UITextField) {
        if let text = textField.text {
            var str = ""
            let textArray = Array(text)
            for i in 0...3 {
                if text.count >= (i + 1) {
                    str += String(textArray[i])
                } else {
                    str += "-"
                }
                if i != 3 {
                    str += " "
                }
            }
            rightLabel.text = str
        } else {
            rightLabel.text = "- - - -"
        }
    }
    
    private func addTextChecker () {
        infoTextField.addTarget(self, action: #selector(textFieldCheckEmail(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldCheckEmail (_ textField: UITextField) {
        if let text = textField.text {
            if isValidEmail(text) == true {
                leftButton.isHidden = false
            } else {
                leftButton.isHidden = true
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

