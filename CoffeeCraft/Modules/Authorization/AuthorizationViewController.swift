//
//  AuthorizationViewController.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let authorizationView = AuthorizationView(frame: .zero)
    
    deinit {
        print("vc is deinited")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        super.loadView()
        view = authorizationView
    }
    
    private func setupUI() {
        authorizationView.didLoginBtnTapped = { [weak self] in
            guard let self else { return }
            //let vc = MenuBarViewController()
            //self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
