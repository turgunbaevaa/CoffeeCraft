//
//  JSONParser.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

struct JSONParser {
    let decoder = JSONDecoder() // -> json -> struct
    let encoder = JSONEncoder() // -> struct -> json
    
    func decode<T: Codable>(with data: Data, completion: (Result<T,Error>) -> Void){
        do {
            let product = try decoder.decode(T.self, from: data)
            completion(.success(product))
        } catch let error {
            completion(.failure(error))
        }
    }
}
