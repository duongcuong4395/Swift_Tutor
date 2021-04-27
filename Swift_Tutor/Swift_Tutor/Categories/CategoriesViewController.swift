//
//  CategoriesViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/17/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CategoriesViewController: UIViewController {
    
    let categoryTableView = CategoryTableView()
    
    let dataSource = ListCategoryDataSource()
    lazy var categoryViewModel : CategoryViewModel = {
        let categoryViewModel = CategoryViewModel(dataSource: dataSource)
        return categoryViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupViews()
    }
    
    private func setupViews() {
        setupCategoryTableView()
    }
    
    private func setupCategoryTableView() {
        setupConstrainsCategoryTableView()
        
        self.categoryViewModel.fetchCategory()
        
        categoryTableView.dataSource = self.dataSource
        categoryTableView.delegate = self
        
        categoryViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.categoryTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List Categories", wc.name as Any)
                }
                
            }
        })
    }
    
    // MARK: Constrains
    private func setupConstrainsCategoryTableView() {
        view.addSubview(categoryTableView)
        
        categoryTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
    // MARK: Navigate
    private func setupNavigate() {
        
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftNavigateEvent))
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightNavigateEvent))
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        self.title = "Categories"
        
    }
    
    @objc func leftNavigateEvent() {
        print("Clicked/Touched left_Navigate")
    }
    
    @objc func rightNavigateEvent() {
        print("Clicked/Touched right_Navigate")
    }
}


extension CategoriesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let category = self.categoryViewModel.dataSource?.data.value[indexPath.row] {
            
            var vc = UIViewController()
            
            switch category.name {
            case Title.Category.uiElement:
                vc = UIElementsViewController()
            case Title.Category.iosFrameworks:
                vc = iOSFrameworksViewController()
            case Title.Category.networks:
                vc = NetworkViewController()
            case Title.Category.git:
                vc = GitViewController()
            default:
                vc = UIElementsViewController()
            }
            
            self.navigationController!.pushViewController(vc, animated: true)
        }
    }
}
