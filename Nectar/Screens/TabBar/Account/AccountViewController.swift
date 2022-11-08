//
//  AccountViewController.swift
//  Nectar
//
//  Created by  User on 26.10.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    let accountInfo = [("orders", "Orders"),
                       ("details", "My Details"),
                       ("address", "Delivery Address"),
                       ("payment", "Payment Methods"),
                       ("promo-code", "Promo Code"),
                       ("bell", "Notifications"),
                       ("help", "Help"),
                       ("about", "About"),
    ]
    
    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 27
        imageView.clipsToBounds = true
        imageView.image = UIImage(asset: Asset.Assets.avatar)
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.text = "Afsar Hossen"
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.regular, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        label.text = "Imshuvo97@gmail.com"
        return label
    }()
    
    private var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.editPencil), for: .normal)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.reuseId)
        return tableView
    }()
    
    private var logOutButton: UIButton = {
        let button = CustomButton(title: "Log Out", color: Asset.Colors.searchLightGray)
        button.changeTitleColor(color: UIColor(asset: Asset.Colors.green) ?? .black)
        
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.logOut)
        
        button.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.bottom.equalToSuperview().inset(24)
            $0.width.equalTo(18)
        }
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
    }
    
    private func setUpView () {
        view.backgroundColor = .white
    }
    
    private func setUpConstraints () {
        [avatarImageView, nameLabel, emailLabel, editButton, tableView, logOutButton].forEach {
            view.addSubview($0)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(69)
            $0.width.height.equalTo(64)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(20)
            $0.top.equalToSuperview().offset(81)
        }
        
        emailLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(20)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        editButton.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(80)
            $0.height.width.equalTo(15)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(avatarImageView.snp.bottom).offset(30)
        }
        
        logOutButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            $0.height.equalTo(67)
        }
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accountInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseId, for: indexPath) as? AccountTableViewCell else {return UITableViewCell()}
        cell.configure(image: accountInfo[indexPath.row].0, title: accountInfo[indexPath.row].1)
        return cell
    }
    
    
}
