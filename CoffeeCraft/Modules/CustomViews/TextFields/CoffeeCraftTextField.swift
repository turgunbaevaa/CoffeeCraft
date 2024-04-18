//
//  CoffeeCraftTextField.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class CoffeeCraftTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        set(placeholder: placeholder)
    }
    
    private func configure() {
        layer.cornerRadius = 25
        layer.backgroundColor = UIColor.lightGray.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 10
        
        backgroundColor = .systemGray5
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }
    
    func set(placeholder: String){
        self.placeholder = placeholder
    }
}
