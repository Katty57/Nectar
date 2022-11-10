//
//  CustomPageControl.swift
//  Nectar
//
//  Created by  User on 19.10.2022.
//

import UIKit

class CustomPageControl: UIPageControl {

    init () {
        super.init(frame: .zero)
        
        numberOfPages = 3
        currentPageIndicatorTintColor = UIColor(asset: Asset.Colors.green)
        pageIndicatorTintColor = UIColor(asset: Asset.Colors.searchGray)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
