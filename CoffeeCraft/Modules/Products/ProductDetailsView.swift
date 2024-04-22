//
//  ProductDetailsView.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 22/4/24.
//

import UIKit
import SnapKit

class ProductDetailsView: UIView {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let productImage = CoffeeCraftImageView(frame: .zero)
    private let titleLabel = CoffeeCraftTitleLabel(fontSize: 22, weight: .medium)
    private let areaLabel = CoffeeCraftTitleLabel(fontSize: 20, weight: .medium)
    private let categoryLabel = CoffeeCraftTitleLabel(fontSize: 20, weight: .medium)
    private let descriptionLabel = CoffeeCraftTitleLabel(fontSize: 16, weight: .regular)
    private let buyButton = CoffeeCraftButton(backgroundColor: .orange, titleColor: .label, title: "To order")
    
    var idMeal: String?
    
    var didOrderTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
        buyButton.addTarget(
            self, action: #selector(buyBtnTapped),
            for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(with item: Meal) {
        titleLabel.text = item.strMeal
        areaLabel.text = item.strArea
        categoryLabel.text = item.strCategory
        descriptionLabel.text = item.strInstructions
        
        Task {
            do {
                let image = try await NetworkManager.shared.downloadImage(with: item.strMealThumb)
                DispatchQueue.main.async {
                    self.productImage.image = image
                }
            } catch {
                print("Error downloading image:", error.localizedDescription)
            }
        }
    }
    
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubviews(productImage, titleLabel, areaLabel, categoryLabel, descriptionLabel, buyButton)
        
        productImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(225)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(15)
            make.horizontalEdges.equalTo(contentView).inset(16)
        }
        
        areaLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView).offset(16)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.equalTo(contentView).offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(areaLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(16)
        }
        
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).offset(-10)
            make.height.equalTo(50)
        }
    }
    
    @objc private func buyBtnTapped() {
        didOrderTapped?()
    }
}
