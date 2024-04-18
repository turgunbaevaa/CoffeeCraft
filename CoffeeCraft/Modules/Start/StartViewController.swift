//
//  StartViewController.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class StartViewController: UIViewController {
    
    private let startView = StartView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        super.loadView()
        view = startView
    }
    
    private func setupUI() {
        startView.didLoginBtnTapped = { [weak self] in
            guard let self else { return }
            let vc = AuthorizationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
