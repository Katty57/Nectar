//
//  ProductDetails.swift
//  Nectar
//
//  Created by  User on 01.11.2022.
//

import Foundation

enum ProductDetails {
    case detail(desription: String)
    case nutrition(nutrition: String, desription: String)
    case review(starNumber: Int, desription: String)
}
