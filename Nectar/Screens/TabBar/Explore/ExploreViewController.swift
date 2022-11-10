//
//  ExploreViewController.swift
//  Nectar
//
//  Created by  User on 20.10.2022.
//

import UIKit

class ExploreViewController: UIViewController {
    
    let model = [
        ExploreModel(image: "fruits-vegetables", title: "Frash Fruits & Vegetable", backgoundColor: "#53B175"),
        ExploreModel(image: "oil", title: "Cooking Oil & Ghee", backgoundColor: "#F8A44C"),
        ExploreModel(image: "meat-fish", title: "Meat & Fish", backgoundColor: "#F7A593"),
        ExploreModel(image: "bakery", title: "Bakery & Snacks", backgoundColor: "#D3B0E0"),
        ExploreModel(image: "dairy", title: "Dairy & Eggs", backgoundColor: "#FDE598"),
        ExploreModel(image: "beverages", title: "Beverages", backgoundColor: "#B7DFF5"),
        ExploreModel(image: "fruits-vegetables", title: "Frash Fruits & Vegetable", backgoundColor: "#53B175"),
        ExploreModel(image: "oil", title: "Cooking Oil & Ghee", backgoundColor: "#F8A44C")
        ]
    
    let beveragesModel = [
        Product(image: "cola-diet", name: "Diet Coke", description: "355ml, Price", price: "1.99"),
        Product(image: "sprite", name: "Sprite Can", description: "325ml, Price", price: "1.50"),
        Product(image: "juice-grape", name: "Apple & Grape Juice", description: "2L, Price", price: "15.99"),
        Product(image: "juice-orange", name: "Orenge Juice", description: "2L, Price", price: "15.99"),
        Product(image: "cola", name: "Coca Cola Can", description: "325ml, Price", price: "4.99"),
        Product(image: "pepsi", name: "Pepsi Can", description: "330ml, Price", price: "4.99"),
        Product(image: "juice-grape", name: "Apple & Grape Juice", description: "2L, Price", price: "15.99"),
        Product(image: "juice-orange", name: "Orenge Juice", description: "2L, Price", price: "15.99")
    ]
    
    private lazy var searchBar: CustomSearchBar = {
        let searchBar = CustomSearchBar()
        searchBar.searchTextField.delegate = self
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: ExploreCollectionViewCell.reuseId)
        return collectionView
    }()
    
    private var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.filter), for: .normal)
        button.isHidden = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
//        addGecture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    private func addGecture () {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setUpView () {
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        titleLabel.text = "Find Products"
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(15)
        }
        navigationItem.titleView = titleView
        view.backgroundColor = .white
    }
    
    private func setUpConstraints () {
        [filterButton, searchBar, collectionView].forEach {
            view.addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(51)
        }
        filterButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-27)
            $0.height.equalTo(17)
            $0.width.equalTo(16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(27)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let spaceWidth: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let spaceHeight: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.top ?? 0.0) + (flowayout?.sectionInset.bottom ?? 0.0)
        let width: CGFloat = (collectionView.frame.size.width - spaceWidth) / 2.0
        let height: CGFloat = (collectionView.frame.size.height - spaceHeight) / 3.2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.reuseId, for: indexPath) as? ExploreCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = model[indexPath.row].title
        let vc = ExploreCategoryViewController(title: title, model: beveragesModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExploreViewController: UITextFieldDelegate, TextFieldValueUser {
    
    func updateView(with text: String) {
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationController?.navigationBar.isHidden = true
        collectionView.isHidden = true
        filterButton.isHidden = false
        searchBar.snp.remakeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalTo(filterButton.snp.leading).offset(-19)
            $0.height.equalTo(51)
        }
    }
}
