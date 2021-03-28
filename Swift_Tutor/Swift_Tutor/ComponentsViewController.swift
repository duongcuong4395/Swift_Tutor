//
//  ComponentsViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit
import SnapKit


class ComponentsViewController: UIViewController {
    
    let componentTableView = ComponentTableView()
    
    let dataSource = ListComponentDataSource()
    lazy var componentViewModel : ComponentViewModel = {
        let componentViewModel = ComponentViewModel(dataSource: dataSource)
        return componentViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Components"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup_Views()
    }
    
    
    func setup_Views() {
        setup_componentTableView()
    }
    
    func setup_componentTableView() {
        setup_Constrains_setup_componentTableView()
        
        self.componentViewModel.fetchCategory()
        
        componentTableView.dataSource = self.dataSource
        componentTableView.delegate = self
        
        componentViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.componentTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print(wc.name as Any)
                }
                
            }
        })
    }
    
    // MARK: Constrains
    func setup_Constrains_setup_componentTableView() {
        view.addSubview(componentTableView)
        
        componentTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
}



extension ComponentsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let component = self.componentViewModel.dataSource?.data.value[indexPath.row]
        print("Component name selected ", component!.name as Any)
        print("Component image selected ", component!.image as Any)
        
        let navigationController = UINavigationController(rootViewController: ComptTutorialViewController())
        self.present(navigationController, animated: true, completion: nil)
    }
}
