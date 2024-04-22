//
//  NetworkManager.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    private let baseURL = URL(string: "https://www.themealdb.com/api/json/v1/1/")!
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    func fetchCategories() async throws -> [Category] {
        let url = baseURL.appendingPathComponent("categories.php")
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        guard let url = components?.url else { throw NetworkError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let categories = try decoder.decode(Categories.self, from: data)
        
        return categories.categories
    }
    
    func fetchProducts(by categoryName: String) async throws -> [Product] {
        let url = baseURL.appendingPathComponent("filter.php")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [.init(name: "c", value: categoryName)]
        
        guard let url = components?.url else { throw NetworkError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let model = try decoder.decode(Products.self, from: data)
        
        return model.meals
    }
    
    func fetchIdMealDetails(by idMeal: String) async throws -> Meal {
        let url = baseURL.appendingPathComponent("lookup.php")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [.init(name: "i", value: idMeal)]
        
        guard let url = components?.url else { throw NetworkError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let model = try decoder.decode(Meals.self, from: data)
        guard let firstMeal = model.meals.first else { throw NetworkError.noMealFound }
        
        return firstMeal
    }
    
    func downloadImage(with urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "InvalidURL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "InvalidImageData", code: 0, userInfo: nil)
        }
        
        return image
    }
}

enum NetworkError: Error {
    case invalidURL
    case noMealFound
}
