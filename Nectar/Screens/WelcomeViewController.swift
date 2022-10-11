//
//  ViewController.swift
//  Nectar
//
//  Created by  User on 10.10.2022.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome-screen-background")
        return imageView
    }()
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.325, green: 0.694, blue: 0.459, alpha: 1)
        button.layer.cornerRadius = 19
        button.clipsToBounds = true

        let label = UILabel()
        label.text = "Get Started"
        label.font = UIFont(name: "Gilroy-Semibold", size: 18)
        label.textColor = UIColor(red: 1, green: 0.976, blue: 1, alpha: 1)
        
        button.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(getStartedPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var subheadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Get your groceries in as fast as one hour"
        label.textColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 0.7)
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        return label
    }()
    
    lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Welcome
        to our store
        """
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-Semibold", size: 48)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrot-logo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configConstraints()
    }

    private func addSubviews () {
        [backgroundImage, getStartedButton, subheadingLabel, headingLabel, logoImage].forEach {
            view.addSubview($0)
        }
    }
    
    private func configConstraints () {
        backgroundImage.snp.makeConstraints { make in
            make.centerX.centerY.height.width.equalToSuperview()
        }
        
        getStartedButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-90)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(67)
        }
        
        subheadingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(getStartedButton.snp.top).offset(-40)
            make.leading.equalToSuperview().offset(59)
            make.trailing.equalToSuperview().offset(-59)
        }
        
        headingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subheadingLabel.snp.top).offset(-19)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(headingLabel.snp.top).offset(-35)
        }
    }
    
    @objc private func getStartedPressed (_ sender: UIButton) {
        let vc = SignInViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
}
