//
//  MinusAndPlusButton.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class MinusAndPlusButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, tintColor: UIColor, image: String) {
        self.init(frame: .zero)
        set(backgroundColor: backgroundColor, tintColor: tintColor, image: image)
    }
    
    private func configure() {
        layer.cornerRadius = 14
        clipsToBounds = true
    }
    
    func set(backgroundColor: UIColor, tintColor: UIColor, image: String) {
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = tintColor
        setImage(UIImage(systemName: image), for: .normal)
        setTitleColor(tintColor, for: .normal)
    }
}
