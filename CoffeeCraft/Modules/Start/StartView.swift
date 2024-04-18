//
//  StartView.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit
import SnapKit

class StartView: UIView {

    let logoImageView = CoffeeCraftImageView(image: UIImage(named: "logo")!)
    let logInButton = CoffeeCraftButton(backgroundColor: .orange, titleColor: .white, title: "Log in")
    let registerButton = CoffeeCraftButton(backgroundColor: .clear, titleColor: .lightGray, title: "Register")
    
    var didLoginBtnTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews(logoImageView, logInButton, registerButton)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(235)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(170)
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(98)
            make.centerX.equalToSuperview()
            make.height.equalTo(56)
            make.width.equalTo(343)
        }
        logInButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(56)
            make.width.equalTo(343)
        }
    }
    
    @objc private func loginButtonTapped() {
        didLoginBtnTapped?()
    }
}
