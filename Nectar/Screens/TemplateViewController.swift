//
//  TemplateViewController.swift
//  Nectar
//
//  Created by  User on 12.10.2022.
//

import UIKit

class TemplateViewController: UIViewController {
    
    private lazy var topMask: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.topMask)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var bottomMask: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.bottomMask)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        addSubviews()
        configConstraints()
        addGesture()
    }
    
    private func setUpView () {
        view.backgroundColor = UIColor(asset: Asset.Colors.lightGray)
        
        let leftBarButton = UIBarButtonItem(image: UIImage(asset: Asset.Assets.backButton), style: .plain, target: self, action: #selector(popToPrevious))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func addGesture () {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func popToPrevious (_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addSubviews() {
        [topMask, bottomMask, contentScrollView].forEach {
            view.addSubview($0)
        }
        contentScrollView.addSubview(contentView)
    }
    
    func configConstraints() {
        topMask.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(233)
        }
        
        bottomMask.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(302)
        }
        
        contentScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(view.snp.height)
        }
    }
}
