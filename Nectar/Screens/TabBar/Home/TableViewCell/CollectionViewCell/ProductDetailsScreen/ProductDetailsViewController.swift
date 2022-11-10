//
//  ProductDetailsViewController.swift
//  Nectar
//
//  Created by  User on 28.10.2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    private var productDetails: [ProductDetails] = [.detail(desription: "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."),
                                                    .nutrition(nutrition: "100", desription: "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."),
                                                    .review(starNumber: 3, desription: "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.")
    ]

    private var productImagePageControl: UIPageControl = {
        let pageControl = CustomPageControl()
        return pageControl
    }()
    
    private var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var productImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(asset: Asset.Colors.searchLightGray)
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        [productImage, blurView, productImagePageControl].forEach {
            view.addSubview($0)
        }
        productImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-57)
            $0.width.equalTo(295)
            $0.height.equalTo(171)
        }
        blurView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        productImagePageControl.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.centerX.equalToSuperview()
        }
        return view
    }()
    
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.bold, size: 24)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        return label
    }()
    
    private var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.textColor = UIColor(asset: Asset.Colors.subtitleGray)
        return label
    }()
    
    private var addToFavouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.notFavourite), for: .normal)
        button.setImage(UIImage(asset: Asset.Assets.isFavourite), for: .selected)
        return button
    }()
    
    private var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.minus), for: .normal)
        return button
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 16)
        label.text = "1"
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(asset: Asset.Colors.plusBorderGray)?.cgColor
        label.layer.cornerRadius = 17
        label.clipsToBounds = true
        label.snp.makeConstraints {
            $0.width.equalTo(45)
        }
        return label
    }()

    private var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.plus), for: .normal)
        return button
    }()
    
    private lazy var countStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        [minusButton, countLabel, plusButton].forEach{
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.bold, size: 24)
        label.textColor = UIColor(asset: Asset.Colors.questionBlack)
        return label
    }()
    
    private lazy var addToBasketButton: UIButton = {
        let button = CustomButton(title: "Add To Basket", color: Asset.Colors.green)
        button.addTarget(self, action: #selector(addToBasket(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var addToCartButton: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = UIColor(asset: Asset.Colors.green)
        greenView.clipsToBounds = true
        greenView.layer.cornerRadius = 19
        greenView.isHidden = true
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.15)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.addToCartCheckmark)
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(7)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.width.equalTo(17)
            $0.height.equalTo(13)
        }
        
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 18)
        label.textColor = UIColor(asset: Asset.Colors.lightGray)
        label.text = "Add to Cart"
        
        let labelToCart = UILabel()
        labelToCart.font = UIFont(font: FontFamily.Gilroy.semiBold, size: 14)
        labelToCart.textColor = UIColor(asset: Asset.Colors.lightGray)
        labelToCart.text = "Open Cart"
        labelToCart.isUserInteractionEnabled = true
        let imageViewToCart = UIImageView()
        imageViewToCart.isUserInteractionEnabled = true
        imageViewToCart.image = UIImage(asset: Asset.Assets.goToCart)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToCart(_:)))
        labelToCart.addGestureRecognizer(gesture)
        imageViewToCart.addGestureRecognizer(gesture)
        
        
        [view, label, labelToCart, imageViewToCart].forEach {
            greenView.addSubview($0)
        }
        view.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.leading.equalTo(view.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        imageViewToCart.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(6)
            $0.height.equalTo(10)
        }
        labelToCart.snp.makeConstraints {
            $0.trailing.equalTo(imageViewToCart.snp.leading).offset(-7)
            $0.centerY.equalToSuperview()
        }
        return greenView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductDescriptionTableViewCell.self, forCellReuseIdentifier: ProductDescriptionTableViewCell.reuseId)
        tableView.register(NutritionsTableViewCell.self, forCellReuseIdentifier: NutritionsTableViewCell.reuseId)
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.reuseId)
        return tableView
    }()
    
    init (_ product: Product) {
        super.init(nibName: nil, bundle: nil)
        
        productImage.image = UIImage(named: product.image)
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setUpView() {
        view.backgroundColor = .white
        
        let leftBarButton = UIBarButtonItem(image: UIImage(asset: Asset.Assets.backButton), style: .plain, target: self, action: #selector(popToPrevious))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func setUpConstraints() {
        let scrollView = UIScrollView()
        let contentView = UIView()
        
        view.addSubview(scrollView)
        view.addSubview(addToBasketButton)
        view.addSubview(addToCartButton)
        scrollView.addSubview(contentView)
        [productImageView, productNameLabel, productDescriptionLabel, addToFavouriteButton, countStackView, priceLabel, tableView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.bottom.equalTo(view.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(view.snp.height)
        }
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(371)
        }
        productNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(productImageView.snp.bottom).offset(30)
            $0.width.equalTo(339)
        }
        productDescriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(productNameLabel.snp.bottom).offset(10)
            $0.width.equalTo(339)
        }
        addToFavouriteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-25)
            $0.top.equalTo(productImageView.snp.bottom).offset(26)
            $0.height.width.equalTo(24)
        }
        countStackView.snp.makeConstraints {
            $0.top.equalTo(productDescriptionLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
             $0.width.equalTo(119)
             $0.height.equalTo(45)
        }
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-25)
            $0.centerY.equalTo(countStackView.snp.centerY)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(countStackView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview()
        }
        addToBasketButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().offset(-38)
            $0.height.equalTo(67)
        }
        addToCartButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().offset(-38)
            $0.height.equalTo(67)
        }
    }
    
    @objc private func popToPrevious (_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch productDetails[indexPath.section] {
        case let .detail(description):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDescriptionTableViewCell.reuseId, for: indexPath) as? ProductDescriptionTableViewCell else { return UITableViewCell() }
            cell.configure(title: "Product Detail", description: description)
            return cell
        case let .nutrition(nutrition, description):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NutritionsTableViewCell.reuseId, for: indexPath) as? NutritionsTableViewCell else { return UITableViewCell() }
            cell.configure(title: "Nutritions", nutrition: nutrition, description: description)
            return cell
        case let .review(num, description):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.reuseId, for: indexPath) as? ReviewTableViewCell else { return UITableViewCell() }
            cell.configure(title: "Review", starNumber: num, description: description)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            self.tableView.performBatchUpdates(nil)
        }
    }
       
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       if let cell = self.tableView.cellForRow(at: indexPath) as? ProductDescriptionTableViewCell {
           cell.hideDetailsView()
       }
   }
    
    @objc private func addToBasket (_ sender: UIButton) {
        addToBasketButton.isHidden.toggle()
        addToCartButton.isHidden.toggle()
    }
    
    @objc private func goToCart (_ sender: UITapGestureRecognizer? = nil) {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
