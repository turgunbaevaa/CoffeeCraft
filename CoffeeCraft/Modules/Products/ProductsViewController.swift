//
//  ProductsViewController.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {
    
    private let productDetailsView = ProductDetailsView()
    var idMeal: String!
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadMealDetails(idMeal: idMeal)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(productDetailsView)
        productDetailsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        productDetailsView.didOrderTapped = { [ weak self ] in
            guard let self else { return }
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func loadMealDetails(idMeal: String) {
        Task {
            do {
                let mealDetails = try await networkManager.fetchIdMealDetails(by: idMeal)
                DispatchQueue.main.async {
                    self.productDetailsView.fill(with: mealDetails)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
