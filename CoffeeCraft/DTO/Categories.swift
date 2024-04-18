//
//  Categories.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable, Equatable {
    let strCategory: String
}
