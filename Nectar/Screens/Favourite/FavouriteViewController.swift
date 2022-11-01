//
//  FavouriteViewController.swift
//  Nectar
//
//  Created by  User on 25.10.2022.
//

import UIKit

class FavouriteViewController: UIViewController {

    let model = [
        FavouriteModel(image: "sprite", name: "Sprite Can", description: "325ml, Price", price: "1.50"),
        FavouriteModel(image: "cola-diet", name: "Diet Coke", description: "355ml, Price", price: "1.99"),
        FavouriteModel(image: "juice-grape", name: "Apple & Grape Juice", description: "2L, Price", price: "15.50"),
        FavouriteModel(image: "cola", name: "Coca Cola Can", description: "325ml, Price", price: "4.99"),
        FavouriteModel(image: "pepsi", name: "Pepsi Can", description: "330ml, Price", price: "4.99")
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = CustomButton(title: "Add All To Cart", color: Asset.Colors.green)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpConstraints()
    }

    private func setUpNavigationBar () {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        titleLabel.text = "Favourite"
        navigationItem.titleView = titleLabel
        view.backgroundColor = .white
    }
    
    private func setUpConstraints () {
        [tableView, addToCartButton].forEach {
            view.addSubview($0)
        }
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        addToCartButton.snp.makeConstraints {
            $0.height.equalTo(67)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.reuseId, for: indexPath) as? FavouriteTableViewCell else { return UITableViewCell() }
        cell.configure(model[indexPath.row])
        return cell
    }
}
