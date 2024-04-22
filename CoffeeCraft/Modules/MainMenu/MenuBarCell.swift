//
//  MenuBarViewCell.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit
import SnapKit

class MenuBarCell: UICollectionViewCell {
    
    static let reuseId = "coffeeBar_cell"
    
    private let titleLabel = CoffeeCraftTitleLabel(fontSize: 16, weight: .regular)
    
    private lazy var menuLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        clipsToBounds = true
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews(menuLabelView, titleLabel)
        
        menuLabelView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func setMenuBarData(with model: Category) {
        titleLabel.text = model.strCategory
    }
}
