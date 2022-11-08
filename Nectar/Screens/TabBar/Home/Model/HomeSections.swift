//
//  HomeTableViewDataSource.swift
//  Nectar
//
//  Created by  User on 20.10.2022.
//

import Foundation

struct HomeSections {
    enum Rows {
        case banner(model: [HomeBanner])
        case header(title: String)
        case product(product: [Product])
        case bannerCategory(categories: [HomeBannerCategory])
    }
    
    let rows: [Rows]
}

