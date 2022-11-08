//
//  CustomSearchBar.swift
//  Nectar
//
//  Created by  User on 21.10.2022.
//

import UIKit

protocol TextFieldValueUser {
    func updateView (with text: String)
}

class CustomSearchBar: UIView {
    
//    private var valueUser: TextFieldValueUser
    
    private var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.searchMagnifier), for: .normal)
        return button
    }()
    
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.searchCancel), for: .normal)
        button.isHidden = true
        return button
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search Store"
        textField.textColor = UIColor(asset: Asset.Colors.searchGray)
        textField.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        textField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    init () {
        
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
    }
    
//    init (textFiledValueUser: TextFieldValueUser) {
//        self.valueUser = textFiledValueUser
//
//        super.init(frame: .zero)
//        setUpView()
//        setUpConstraints()
//    }
    
    private func setUpView () {
        backgroundColor = UIColor(asset: Asset.Colors.searchLightGray)
        clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    private func setUpConstraints () {
        [searchButton, cancelButton, searchTextField].forEach {
            addSubview($0)
        }
        
        searchButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(18)
            $0.width.equalTo(17)
        }
        
        cancelButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-12)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(15)
            $0.width.equalTo(15)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(searchButton.snp.trailing).offset(9)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(17)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-9)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomSearchBar: UITextFieldDelegate {
    
    @objc func textFieldDidChanged (_ sender: UITextField) {
        if let text = sender.text {
            cancelButton.isHidden = false
//            valueUser.updateView(with: text)
        } else {
            cancelButton.isHidden = true
        }
    }
}
