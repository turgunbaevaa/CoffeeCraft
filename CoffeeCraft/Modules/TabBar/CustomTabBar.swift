//
//  CustomTabBar.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import UIKit
import SnapKit

class CustomTabBar: UITabBar {

    private let qrButton = QRButton()
    
    override func draw(_ rect: CGRect) {
        configureShape()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()
        setupQRButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        tintColor = .black
        unselectedItemTintColor = .black
    }
    
    private func setupQRButton() {
        addSubview(qrButton)
        qrButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        qrButton.frame.contains(point) ? qrButton : super.hitTest(point, with: event)
    }
}

extension CustomTabBar {
    private func configureShape() {
        let path = getBezierPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.systemGray6.cgColor
        layer.insertSublayer(shape, at: 0)
    }
    
    private func getBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 0))
        
        path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0),
                    radius: 30,
                    startAngle: .pi,
                    endAngle: .pi * 2,
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        return path
    }
}
