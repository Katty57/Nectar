//
//  CustomNavigationBar.swift
//  Nectar
//
//  Created by  User on 22.10.2022.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    
    init () {
        let width = UIApplication.shared.statusBarFrame.width
        let y = UIApplication.shared.statusBarFrame.height
        super.init(frame: CGRect(x: 0, y: y, width: width, height: 50))
    }
    
    private func setUpNavBar () {
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle (text: String) {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(font: FontFamily.Gilroy.bold, size: 20)
        titleLabel.textColor = UIColor(asset: Asset.Colors.questionBlack)
        titleLabel.text = text
        let navItem = UINavigationItem()
        navItem.titleView = titleLabel
        setItems([navItem], animated: false)
    }
    
    func setImage () {
        
    }
}

