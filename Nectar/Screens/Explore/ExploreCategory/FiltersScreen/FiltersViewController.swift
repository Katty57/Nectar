//
//  FiltersViewController.swift
//  Nectar
//
//  Created by  User on 28.10.2022.
//

import UIKit

class FiltersViewController: UIViewController {
    
    private var filters = [Filter(title: "Categories", filters: ["Eggs", "Noodles & Pasta", "Chips & Crisps", "Fast Food"]),
                           Filter(title: "Brand", filters: ["Individual Callection", "Cocola", "Ifad", "Kazi Farmas"])
    ]
    
    private lazy var underTableViewView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(asset: Asset.Colors.searchLightGray)
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(asset: Asset.Colors.searchLightGray)
        tableView.register(FiltersTableViewCell.self, forCellReuseIdentifier: FiltersTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var applyFilterButton: UIButton = {
        let button = CustomButton(title: "Apply Filter", color: Asset.Colors.green)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpConstraints()
    }
    
    private func setUpView () {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        titleLabel.text = "Filters"
        navigationItem.titleView = titleLabel
        let closeButton = UIBarButtonItem(image: UIImage(asset: Asset.Assets.cross), style: .done, target: self, action: #selector(closeView(_:)))
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor(asset: Asset.Colors.questionBlack)
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
    }
    
    private func setUpConstraints () {
        [underTableViewView, applyFilterButton].forEach {
            view.addSubview($0)
        }
        underTableViewView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        underTableViewView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        applyFilterButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-38)
            $0.height.equalTo(67)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    @objc private func closeView (_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filters[section].filters.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FiltersTableViewCell.reuseId, for: indexPath) as? FiltersTableViewCell else {return UITableViewCell()}
        cell.configure(filters[indexPath.section].filters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 24)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.text = filters[section].title
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        74
    }
}
