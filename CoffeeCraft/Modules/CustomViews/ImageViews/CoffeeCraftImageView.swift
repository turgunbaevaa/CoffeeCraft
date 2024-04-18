//
//  CoffeeCraftImageView.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

class CoffeeCraftImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage) {
        self.init(frame: .zero)
        self.image = image
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
