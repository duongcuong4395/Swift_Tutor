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
        
        setup_Navigate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup_Views()
    }
    
    func setup_Views() {
        setup_categoryTableView()
    }
    
    func setup_categoryTableView() {
        setup_Constrains_categoryTableView()
        
        self.categoryViewModel.fetchCategory()
        
        categoryTableView.dataSource = self.dataSource
        categoryTableView.delegate = self
        
        categoryViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.categoryTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print(wc.name as Any)
                }
                
            }
        })
    }
    
    // MARK: Constrains
    func setup_Constrains_categoryTableView() {
        view.addSubview(categoryTableView)
        
        categoryTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
    // MARK: Navigate
    func setup_Navigate() {
        
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(left_Navigate_Event))
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(right_Navigate_Event))
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        self.title = "Categories"
        
    }
    
    @objc func left_Navigate_Event() {
        print("Clicked/Touched left_Navigate")
    }
    
    @objc func right_Navigate_Event() {
        print("Clicked/Touched right_Navigate")
    }
}


extension CategoriesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = self.categoryViewModel.dataSource?.data.value[indexPath.row]
        print("category name selected ", category!.name as Any)
        print("category image selected ", category!.image as Any)
        
        let vc = ComponentsViewController()
        self.navigationController!.pushViewController(vc, animated: true)
    }
}
