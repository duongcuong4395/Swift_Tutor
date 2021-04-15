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
        
        setup_Views()
    }
    
    func setup_Views() {
        setup_iosFrameworksTableView()
    }
    
    func setup_iosFrameworksTableView() {
        setup_Constrains_iosFrameworksTableView()
        
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
    
    func setup_Constrains_iosFrameworksTableView() {
        view.addSubview(iosFrameworksTableView)
        
        iosFrameworksTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
}



extension iOSFrameworksViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let iosFWSelected = self.iosFrameworksViewModel.dataSource?.data.value[indexPath.row]
        print("ios Frameworks selected ", iosFWSelected!.name as Any)
        
        /*
        var vc = UIViewController()
        
        switch iosFWSelected?.name {
        case Title.iosFrameworks.coreAnimation:
            vc = CoreAnimationViewController()
        case Title.iosFrameworks.coreData:
            vc = CoreDataViewController()
        default:
            vc = CoreAnimationViewController()
        }
        
        self.navigationController!.pushViewController(vc, animated: true)
        */
        
        
        let comptTutorialViewController = ComptTutorialViewController()
        comptTutorialViewController.comptTutorialViewModel.compSelected = iosFWSelected!
        
        switch iosFWSelected?.name {
        case Title.iosFrameworks.coreData:
            comptTutorialViewController.comptTutorialViewModel.exampleController = CoreDataViewController()
        case Title.iosFrameworks.coreAnimation:
            comptTutorialViewController.comptTutorialViewModel.exampleController = CoreAnimationViewController()
        default:
            comptTutorialViewController.comptTutorialViewModel.exampleController = CoreDataViewController()
        }
        
        
        let navigationController = UINavigationController(rootViewController: comptTutorialViewController)
        
        self.present(navigationController, animated: true, completion: nil)
        
    }
}
