//
//  QRButton.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import UIKit

class QRButton: UIButton {
    
    final class QrButton: UIButton {
        
        override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = frame.width / 2
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
            setImage(UIImage(systemName: "qrcode"), for: .normal)
            tintColor = .white
            backgroundColor = .orange
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize(width: 0, height: 5)
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
