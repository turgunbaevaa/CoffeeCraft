//
//  CoffeeCraftTitleLabel.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class CoffeeCraftTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
    private func configure(){
        textColor = .black
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
    }
}
