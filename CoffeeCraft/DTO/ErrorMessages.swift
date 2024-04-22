//
//  ErrorMessages.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import Foundation

enum ErrorMessages: String, Error {
    case unableToComplete   = "Unable to complete your request. Please, check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please, try again."
    case invalidData        = "The data received from the server was invalid. Please, try again."
    case invalidURL         = "Invalid URL. Please, try again."
}
