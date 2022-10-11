//
//  ViewController.swift
//  Nectar
//
//  Created by  User on 10.10.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.325, green: 0.694, blue: 0.459, alpha: 1)
        let image = UIImageView(image: UIImage(named: "logo-launch"))
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
    }

    
}

