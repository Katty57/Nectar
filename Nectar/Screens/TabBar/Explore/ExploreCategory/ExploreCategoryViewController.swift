//
//  ExploreCategoryViewController.swift
//  Nectar
//
//  Created by  User on 21.10.2022.
//

import UIKit

class ExploreCategoryViewController: UIViewController {
    
    private var model = [Product]()
    
    private lazy var collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: 27, left: 27, bottom: 27, right: 27)
        flowlayout.minimumInteritemSpacing = 14
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    init (title: String, model: [Product]) {
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpConstraints()
    }

    private func setUpNavigationBar () {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        titleLabel.text = self.title
        
        navigationItem.titleView = titleLabel
        view.backgroundColor = .white
        
        tabBarController?.tabBar.isHidden = true
        
        let leftBarButton = UIBarButtonItem(image: UIImage(asset: Asset.Assets.backButton), style: .plain, target: self, action: #selector(popToPrevious))
        self.navigationItem.leftBarButtonItem = leftBarButton
        let rightBarButton = UIBarButtonItem(image: UIImage(asset: Asset.Assets.filter), style: .plain, target: self, action: #selector(goToFilter(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setUpConstraints () {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
}

extension ExploreCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let spaceWidth: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let spaceHeight: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.top ?? 0.0) + (flowayout?.sectionInset.bottom ?? 0.0)
        let width: CGFloat = (collectionView.frame.size.width - spaceWidth) / 2.0
        let height: CGFloat = (collectionView.frame.size.height - spaceHeight) / 3.2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseId, for: indexPath) as? ProductCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(model[indexPath.row])
        return cell
    }
    
    @objc private func popToPrevious (_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func goToFilter (_ sender: UIBarButtonItem) {
        let vc = FiltersViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
