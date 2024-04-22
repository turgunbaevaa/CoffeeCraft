//
//  AuthorizationView.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit
import SnapKit

class AuthorizationView: UIView {
    
    let logoImageView = CoffeeCraftImageView(image: UIImage(named: "logo")!)
    let logInTitle = CoffeeCraftTitleLabel(fontSize: 34, weight: .regular)
    let logInTextField = CoffeeCraftTextField(placeholder: "555 555 555 555")
    let logInButton = CoffeeCraftButton(backgroundColor: .orange, titleColor: .white, title: "Log in")
    
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
        addSubviews(logoImageView, logInTitle, logInTextField, logInButton)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(193)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(170)
        }
        
        logInTitle.text = "Вход"
        logInTitle.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(20)
        }
        
        logInTextField.snp.makeConstraints { make in
            make.top.equalTo(logInTitle.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(logInTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    @objc private func logInButtonTapped() {
        didLoginBtnTapped?()
    }
}
