//
//  TabBarViewController.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {

    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(customTabBar, forKey: "tabBar")
        setupTabBarItems()
    }

    private func setupTabBarItems() {
        let homeVC = MenuBarViewController()
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        let basketVC = ProductsViewController()
        basketVC.tabBarItem.image = UIImage(systemName: "basket")
        
        let startVC = StartViewController()
        startVC.tabBarItem.image = UIImage(systemName: "safari")
        
        let authVC = AuthorizationViewController()
        authVC.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([homeVC, basketVC, startVC, authVC], animated: true)
    }
}
