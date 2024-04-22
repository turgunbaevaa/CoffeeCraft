//
//  ProductsCell.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit
import SnapKit

protocol ProductsCellDelegate {
    func increase()
    func decrease()
}

class ProductsCell: UICollectionViewCell {
    
    static let reuseId = "coffee_cell"
    
    private let cellImageView = CoffeeCraftImageView(image: UIImage(named: "picture")!)
    private let titleLabel = CoffeeCraftTitleLabel(fontSize: 16, weight: .regular)
    private let descriptionLabel = CoffeeCraftTitleLabel(fontSize: 12, weight: .regular)
    private let priceLabel = CoffeeCraftTitleLabel(fontSize: 12, weight: .regular)
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private let minusButton = MinusAndPlusButton(backgroundColor: .systemGray6, tintColor: .black, image: "minus")
    private let countLabel = CoffeeCraftTitleLabel(fontSize: 14, weight: .regular)
    private let plusButton = MinusAndPlusButton(backgroundColor: .orange, tintColor: .white, image: "plus")
    
    private lazy var countStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    var delagate: ProductsCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews(cellImageView, titleLabel, descriptionLabel, priceLabel, verticalStackView, minusButton, countLabel, plusButton, countStackView)
        
        cellImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.width.equalTo(90)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(cellImageView.snp.trailing).offset(16)
            make.width.equalTo(144)
            make.bottom.equalToSuperview().offset(-18)
        }
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(priceLabel)
        
        countStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(28)
            make.width.equalTo(94)
        }
        countStackView.addArrangedSubview(minusButton)
        countStackView.addArrangedSubview(countLabel)
        countStackView.addArrangedSubview(plusButton)
        
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    func setData(with model: Product) {
        titleLabel.text = model.strMeal
        priceLabel.text = String(model.idMeal)
        
        Task {
            do {
                let image = try await NetworkManager.shared.downloadImage(with: model.strMealThumb)
                DispatchQueue.main.async {
                    self.cellImageView.image = image
                }
            } catch {
                print("Error downloading image:", error.localizedDescription)
            }
        }
    }
    
    var counter: Int = 0 {
        didSet {
            countLabel.text = "\(counter)"
        }
    }
    
    @objc private func plusButtonTapped() {
        counter += 1
    }
    
    @objc private func minusButtonTapped() {
        counter = max(0, counter - 1)
    }
}
