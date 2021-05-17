//
//  iOSFrameworksViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/6/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

class iOSFrameworksViewController: UIViewController {
    
    let iosFrameworksTableView = IOSFrameworksTableView()
    
    let dataSource = IOSFrameworksDataSource()
    lazy var iosFrameworksViewModel : IOSFrameworksViewModel = {
        let iosFrameworksViewModel = IOSFrameworksViewModel(dataSource: dataSource)
        return iosFrameworksViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Category.iosFrameworks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupViews()
    }
    
    private func setupViews() {
        setupIOSFrameworksTableView()
    }
    
    private func setupIOSFrameworksTableView() {
        setupConstrainsIOSFrameworksTableView()
        
        self.iosFrameworksViewModel.fetchData()
        
        self.iosFrameworksTableView.dataSource = self.dataSource
        self.iosFrameworksTableView.delegate = self
        
        iosFrameworksViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.iosFrameworksTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List ios Frameworks", wc.name as Any)
                }
                
            }
        })
    }
    
    private func setupConstrainsIOSFrameworksTableView() {
        view.addSubview(iosFrameworksTableView)
        
        iosFrameworksTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
}



extension iOSFrameworksViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let iosFWSelected = self.iosFrameworksViewModel.dataSource?.data.value[indexPath.row] {
            let comptTutorialViewController: Any
            
            switch iosFWSelected.name {
            case Title.IOSFrameworks.coreData:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: iosFWSelected, exampleController: CoreDataViewController())
            case Title.IOSFrameworks.coreAnimation:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: iosFWSelected, exampleController: CoreAnimationViewController())
            default:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: iosFWSelected, exampleController: CoreDataViewController())
            }
            
            let navigationController = UINavigationController(rootViewController: comptTutorialViewController as! UIViewController)
            
            self.present(navigationController, animated: true, completion: nil)
        }
        
    }
}
