//
//  ViewController.swift
//  Nectar
//
//  Created by  User on 10.10.2022.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    private var coordinator: Coordinatable
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.welcomeScreenBackground)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = CustomButton(title: "Get Started", color: Asset.Colors.green)
        button.addTarget(self, action: #selector(getStartedPressed), for: .touchUpInside)
        return button
    }()
    
    private var subheadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Get your groceries in as fast as one hour"
        label.textColor = UIColor(asset: Asset.Colors.lightGray)
        label.font = UIFont(font: FontFamily.Gilroy.medium, size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var headingLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Welcome
        to our store
        """
        label.textColor = .white
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 48)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.carrotLogo)
        return imageView
    }()
    
    init (coordinator: Coordinatable) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        backgroundImage.snp.makeConstraints {
            $0.centerX.centerY.height.width.equalToSuperview()
        }
        
        getStartedButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-90)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(67)
        }
        
        subheadingLabel.snp.makeConstraints {
            $0.bottom.equalTo(getStartedButton.snp.top).offset(-40)
            $0.leading.trailing.equalToSuperview().inset(59)
        }
        
        headingLabel.snp.makeConstraints {
            $0.bottom.equalTo(subheadingLabel.snp.top).offset(-19)
            $0.leading.trailing.equalToSuperview().inset(80)
        }
        
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(headingLabel.snp.top).offset(-35)
        }
    }
    
    @objc private func getStartedPressed (_ sender: UIButton) {
        if let coordinator = self.coordinator as? WelcomeCoordinator {
            coordinator.buttonTaped()
        }
    }
}
