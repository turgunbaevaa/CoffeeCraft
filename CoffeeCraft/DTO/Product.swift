//
//  Product.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import Foundation

struct ProductsData: Codable {
    let meals: [Product]
}

struct Product: Codable {
    let productName: String
    let productDescription: String
    let productPrice: Int
    let productIcon: String
}
