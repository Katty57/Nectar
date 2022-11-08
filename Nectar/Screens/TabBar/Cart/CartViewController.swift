//
//  CartViewController.swift
//  Nectar
//
//  Created by  User on 22.10.2022.
//

import UIKit

class CartViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    let model = [
        CartModel(image: "bell-pepper", name: "Bell Pepper Red", description: "1kg, Price", price: "4.99", count: 1),
        CartModel(image: "egg-brown", name: "Egg Chicken Red", description: "4pcs, Price", price: "1.99", count: 1),
        CartModel(image: "banana", name: "Organic Bananas", description: "12kg, Price", price: "3.00", count: 1),
        CartModel(image: "ginger", name: "Ginger", description: "250gm, Price", price: "2.99", count: 1)
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var totalPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(asset: Asset.Colors.darkGreen)
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        
        let label = UILabel()
        label.text = "$12.96"
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 12)
        label.textColor = UIColor(asset: Asset.Colors.lightGray)
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(2)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        return view
    }()
    
    private lazy var checkoutButton: UIButton = {
        let button = CustomButton(title: "Go to Checkout", color: Asset.Colors.green)
        button.addSubview(totalPriceView)
        totalPriceView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.centerY.equalToSuperview()
        }
        button.addTarget(self, action: #selector(goToCheckout(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpView()
    }
    
    private func setUpView () {
        tabBarController?.tabBar.isHidden = false
    }

    private func setUpNavigationBar () {
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        titleLabel.text = "My Cart"
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(15)
        }
        navigationItem.titleView = titleView
        view.backgroundColor = .white
    }
    
    private func setUpConstraints () {
        [tableView, checkoutButton].forEach {
            view.addSubview($0)
        }
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        checkoutButton.snp.makeConstraints {
            $0.height.equalTo(67)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
    
    @objc private func goToCheckout (_ sender: UIButton) {
        let vc = CheckoutViewController()
        vc.modalPresentationStyle = .overCurrentContext
        tabBarController?.tabBar.isHidden = true
        self.present(vc, animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseId, for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        cell.configure(model[indexPath.row])
        return cell
    }
}
