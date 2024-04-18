//
//  CoffeeCraftButton.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class CoffeeCraftButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, titleColor: UIColor, title: String) {
        self.init(frame: .zero)
        set(backgroundColor: backgroundColor, titleColor: titleColor, title: title)
    }
    
    private func configure() {
        layer.cornerRadius = 25
        clipsToBounds = true
        
        configuration = .filled()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgroundColor: UIColor, titleColor: UIColor, title: String) {
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = titleColor
        configuration?.title = title
        setTitleColor(titleColor, for: .normal)
    }
}
