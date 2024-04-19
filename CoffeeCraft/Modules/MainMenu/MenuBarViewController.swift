//
//  MenuBarViewController.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit
import SnapKit

class MenuBarViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        return view
    }()
    
    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(MenuBarCell.self, forCellWithReuseIdentifier: MenuBarCell.reuseId)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let titleLabel = CoffeeCraftTitleLabel(fontSize: 24)
    
    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(ProductsCell.self, forCellWithReuseIdentifier: ProductsCell.reuseId)
        return view
    }()
    
    private var categories: [Category] = []
    private var products: [Product] = []
    private var counter = CounterModel(counter: 0)
    private var selectedCategoryIndex: Int = 0
    private var selectedCategory: Category?
    private let parser = JSONParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemBackground
        setupConstraints()
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        navigationController?.navigationItem.title = "Menu"
    }
    
    private func setupConstraints() {
        view.addSubviews(searchBar, menuCollectionView, titleLabel, productsCollectionView)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(30)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.height.equalTo(32)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(menuCollectionView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.bottom.equalTo(productsCollectionView.snp.top).offset(-16)
        }
        
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func decodeJSONData(categoriesData: Data, productsData: Data) {
        parser.decode(with: categoriesData) { [weak self] (result: Result<Categories, Error>) in
            switch result {
            case .success(let categories):
                self?.categories = categories.categories
                DispatchQueue.main.async {
                    self?.menuCollectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to decode categories data: \(error)")
            }
        }
        
        parser.decode(with: productsData) { [weak self] (result: Result<ProductsData, Error>) in
            switch result {
            case .success(let products):
                self?.products = products.meals
                DispatchQueue.main.async {
                    self?.productsCollectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to decode products data: \(error)")
            }
        }
    }
    
    private func loadJSONData() {
        if let categoriesURL = Bundle.main.url(forResource: "Category", withExtension: "json"),
           let productsURL = Bundle.main.url(forResource: "Products", withExtension: "json") {
            
            do {
                let categoriesData = try Data(contentsOf: categoriesURL)
                let productsData = try Data(contentsOf: productsURL)
                
                decodeJSONData(categoriesData: categoriesData, productsData: productsData)
            } catch {
                print("Failed to load JSON data:", error)
            }
        } else {
            print("JSON files not found.")
        }
    }
}
extension MenuBarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            return categories.count
        } else if collectionView == productsCollectionView {
            return products.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuBarCell.reuseId, for: indexPath) as! MenuBarCell
            let model = categories[indexPath.row]
            cell.setData(with: model)
            cell.backgroundColor = indexPath.item == selectedCategoryIndex ? .red : .clear
            //menuCollectionView.reloadData()
            return cell
        } else if collectionView == productsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.reuseId, for: indexPath) as! ProductsCell
            let model = products[indexPath.row]
            cell.setData(with: model)
            //productsCollectionView.reloadData()
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension MenuBarViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == menuCollectionView else { return }
        selectedCategoryIndex = indexPath.item
        menuCollectionView.reloadData()
        let category = categories[indexPath.item]
        selectedCategory = category
        guard collectionView == productsCollectionView else { return }
        if indexPath.item <= products.count {
        }
    }
}

extension MenuBarViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productsCollectionView {
            return CGSize(width: 343, height: 89)
        } else if collectionView == menuCollectionView {
            switch indexPath.row {
            case 0...14 :
                return CGSize(width: 105, height: 32)
            default:
                return CGSize(width: view.frame.width, height: 32)
            }
        } else {
            return CGSize(width: 343, height: 89)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == productsCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if collectionView == menuCollectionView {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
        return UIEdgeInsets()
    }
}

extension  MenuBarViewController: ProductsCellDelegate {
    func increase() {
        counter.counter -= 1
        if counter.counter < 0 {
            counter.counter = 0
        }
        productsCollectionView.reloadData()
    }
    
    func decrease() {
        counter.counter += 1
        if counter.counter > 10 {
            counter.counter = 10
        }
        productsCollectionView.reloadData()
    }
}
