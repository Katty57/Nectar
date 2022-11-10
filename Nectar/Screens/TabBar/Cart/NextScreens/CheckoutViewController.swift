//
//  CheckoutViewController.swift
//  Nectar
//
//  Created by  User on 27.10.2022.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    private var checkouts = [Checkout(title: "Delivery", value: "Select Method", image: nil),
                             Checkout(title: "Pament", value: nil, image: "card"),
                             Checkout(title: "Promo Code", value: "Pick discount", image: nil),
                             Checkout(title: "Total Cost", value: "$13.97", image: nil)
    ]
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.layer.cornerRadius = 30
        mainView.clipsToBounds = true
        mainView.backgroundColor = .white
        return mainView
    }()
    
    private var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.cross), for: .normal)
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 24)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.text = "Checkout"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CheckoutTableViewCell.self, forCellReuseIdentifier: CheckoutTableViewCell.reuseId)
        return tableView
    }()
    
    private var termsAndConditionsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        
        var string = NSMutableAttributedString()
        let initialString = ["By placing an order you agree to our", " Terms ", " And ", " Conditions"]
         
        for i in 0..<initialString.count {
            var attributes = [NSAttributedString.Key : Any]()
            if i % 2 == 0 {
                attributes = [NSAttributedString.Key.foregroundColor: UIColor(asset: Asset.Colors.subtitleGray)]
            } else {
                attributes = [NSAttributedString.Key.foregroundColor: UIColor(asset: Asset.Colors.questionBlack)]
            }
            let attributedStr = (NSAttributedString.init(string: initialString[i], attributes: attributes))
            string.append(attributedStr)
        }
        label.attributedText = string
        return label
    }()
    
    private lazy var placeOrderButton: UIButton = {
        let button = CustomButton(title: "Place Order", color: Asset.Colors.green)
        button.addTarget(self, action: #selector(placeOrder(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpView()
        setUpConstraints()
    }
    
    private func setUpView () {
        view.backgroundColor = .black.withAlphaComponent(0.4)
    }
    
    private func setUpConstraints () {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(365)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        scrollView.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(530)
        }
        [closeButton, titleLabel, tableView, termsAndConditionsLabel, placeOrderButton].forEach {
            mainView.addSubview($0)
        }
        closeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-25)
            $0.width.height.equalTo(15)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalTo(closeButton.snp.leading).offset(-10)
            $0.leading.equalToSuperview().offset(25)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(248)
        }
        termsAndConditionsLabel.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-30)
        }
        placeOrderButton.snp.makeConstraints {
            $0.top.equalTo(termsAndConditionsLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(67)
            $0.bottom.equalToSuperview().offset(-38)
        }
    }
    
    @objc private func placeOrder (_ sender: UIButton) {
        let vc = OrderAcceptedViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        dismiss(animated: false, completion: nil)
    }
}

extension CheckoutViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        62
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTableViewCell.reuseId, for: indexPath) as? CheckoutTableViewCell else {return UITableViewCell()}
        cell.configure(checkouts[indexPath.row])
        return cell
    }
}
