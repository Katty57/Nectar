//
//  PhoneEnterViewController.swift
//  Nectar
//
//  Created by  User on 11.10.2022.
//

import UIKit

class PhoneEnterViewController: TemplateViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your mobile number"
        label.textColor = UIColor(asset: Asset.Colors.titleBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 26)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mobile Number"
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        return label
    }()
    
    private lazy var numberView: UIView = {
        let view = UnderlinedTextView(placeholder: "", imageName: Asset.Assets.countryFlag, labelText: "+880")
        view.setNumberKeyboard()
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.nextButton), for: .normal)
        button.addTarget(self, action: #selector(phoneEntered), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardObserver()
    }
    
    private func addKeyboardObserver () {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func addSubviews() {
        super.addSubviews()
        [titleLabel, subtitleLabel, numberView, nextButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func configConstraints() {
        super.configConstraints()
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.leading.equalToSuperview().offset(25)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(25)
        }
        
        numberView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.height.equalTo(39)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-80)
            $0.height.width.equalTo(67)
        }
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
    
    @objc private func phoneEntered (_ sender: UIButton) {
        let vc = VerificationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
