//
//  HomeScreenViewController.swift
//  Nectar
//
//  Created by  User on 18.10.2022.
//

import UIKit

protocol CellDelegate {
    func collectionCellProductSelected(indexPath: IndexPath, tag: Int)
}

class HomeViewController: UIViewController {

    private var sections: HomeSections = .init(rows: [.banner(model: [HomeBanner(image: "top-mask", title: "Fresh Vegetables"), HomeBanner(image: "top-mask", title: "Fresh Fruits"), HomeBanner(image: "top-mask", title: "Fresh Bread")]),
                                                         .header(title: "Exclusive Offer"),
                                                         .product(product: [Product(image: "banana", name: "Organic Bananas", description: "7pcs, Priceg", price: "4.99"),
                                                                            Product(image: "apple", name: "Red Apple", description: "1kg, Priceg", price: "4.99"),
                                                                            Product(image: "banana", name: "Oranges", description: "1kg, Priceg", price: "1.99")]),
                                                         .header(title: "Best Selling"),
                                                         .product(product: [Product(image: "bell-pepper", name: "Bell Pepper Red", description: "1kg, Priceg", price: "4.99"),
                                                                            Product(image: "ginger", name: "Ginger", description: "250gm, Priceg", price: "4.99"),
                                                                            Product(image: "banana", name: "Oranges", description: "1kg, Priceg", price: "1.99")]),
                                                         .header(title: "Groceries"),
                                                         .bannerCategory(categories: [HomeBannerCategory(image: "pulse", color: "#F8A44C", title: "Pulses"),         HomeBannerCategory(image: "rice", color: "#53B175", title: "Rice")]),
                                                         .product(product: [Product(image: "meat", name: "Beef Bone", description: "1kg, Priceg", price: "4.99"),
                                                                            Product(image: "chicken", name: "Broiler Chicken", description: "1kg, Priceg", price: "4.99"),
                                                                            Product(image: "meat-fish", name: "Meat and Fish", description: "1kg, Priceg", price: "5.99")])
    ])
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeBannerTableViewCell.self, forCellReuseIdentifier: HomeBannerTableViewCell.reuseId)
        tableView.register(HomeHeaderTableViewCell.self, forCellReuseIdentifier: HomeHeaderTableViewCell.reuseId)
        tableView.register(HomeProductTableViewCell.self, forCellReuseIdentifier: HomeProductTableViewCell.reuseId)
        tableView.register(HomeBannerCategoryTableViewCell.self, forCellReuseIdentifier: HomeBannerCategoryTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setUpView () {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
    }

    private func setNavigationBarTitle () -> UIView {
        let view = UIView()
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(asset: Asset.Assets.logoColoredCarrot)

        let locationImageView = UIImageView()
        locationImageView.image = UIImage(asset: Asset.Assets.locationPoint)

        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.locationGray)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.text = "Dhaka, Banassre"

        [logoImageView, locationImageView, label].forEach {
            view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(26)
            $0.height.equalTo(30)
        }

        locationImageView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
            $0.width.equalTo(15)
            $0.height.equalTo(18)
        }
        
        label.snp.makeConstraints {
            $0.leading.equalTo(locationImageView.snp.trailing).offset(7)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(7)
        }

        return view
    }
    
    private func setUpConstraints () {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        let contentView = UIView()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(view.snp.height)
        }
        
        let titleView = setNavigationBarTitle()
        let searchBar = CustomSearchBar()
        
        [titleView, searchBar, tableView].forEach {
            contentView.addSubview($0)
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(59)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(51)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections/*[indexPath.section]*/.rows[indexPath.row] {
        case .banner(_):
            return 114
        case .header(_):
            return 79
        case .product(_):
            return 248
        case .bannerCategory(_):
            return 125
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections/*[indexPath.section]*/.rows[indexPath.row] {
            case let .banner(model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeBannerTableViewCell.reuseId, for: indexPath) as? HomeBannerTableViewCell else {return UITableViewCell()}
                cell.configure(model)
            cell.tag = indexPath.row
                return cell
            case let .header(title):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.reuseId, for: indexPath) as? HomeHeaderTableViewCell else {return UITableViewCell()}
                cell.configure(text: title)
            cell.tag = indexPath.row
                return cell
            case let .product(product):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeProductTableViewCell.reuseId, for: indexPath) as? HomeProductTableViewCell else {return UITableViewCell()}
                cell.configure(products: product)
            cell.tag = indexPath.row
            cell.delegate = self
                return cell
            case let .bannerCategory(categories):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeBannerCategoryTableViewCell.reuseId, for: indexPath) as? HomeBannerCategoryTableViewCell else {return UITableViewCell()}
                cell.configure(categories)
            cell.tag = indexPath.row
                return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.rows.count
    }
}

extension HomeViewController: CellDelegate {
    func collectionCellProductSelected(indexPath: IndexPath, tag: Int) {
        switch sections.rows[tag] {
            case let .banner(model):
                break
            case let .header(title):
                break
            case let .product(product):
            let vc = ProductDetailsViewController(product[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
            case let .bannerCategory(categories):
                break
        }
    }
}
