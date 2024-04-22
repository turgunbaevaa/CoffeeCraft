//
//  SplashViewController.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        view.backgroundColor = .systemBackground
        
        let currentTime = Date()
        if let sessionDate = UserDefaults.standard.object(forKey: "session") as? Date, sessionDate >= currentTime {
            showTabBar()
        } else {
            showAuthViewController()
        }
    }
    
    private func showAuthViewController() {
        let authViewController = AuthorizationViewController()
        let navVC = UINavigationController(rootViewController: authViewController)
        navVC.modalPresentationStyle = .fullScreen
        navigationController?.present(navVC, animated: false)
    }
    
    private func showTabBar() {
        let tabBarViewController = TabBarViewController()
        let navVC = UINavigationController(rootViewController: tabBarViewController)
        navVC.modalPresentationStyle = .fullScreen
        navigationController?.present(navVC, animated: false)
    }
}
