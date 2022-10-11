//
//  PhoneEnterViewController.swift
//  Nectar
//
//  Created by  User on 11.10.2022.
//

import UIKit

class PhoneEnterViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
    }
}
