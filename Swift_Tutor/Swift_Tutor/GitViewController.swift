//
//  GitViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/15/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit
import SnapKit


class GitViewController: UIViewController {
    
    let gitTableView = GitTableView()
    
    let dataSource = GitDataSource()
    lazy var gitViewModel : GitViewModel = {
        let gitViewModel = GitViewModel(dataSource: dataSource)
        return gitViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Category.git
        
        setup_Views()
    }
    
    func setup_Views() {
        setup_gitTableView()
    }
    
    func setup_gitTableView() {
        setup_Constrains_gitTableView()
        
        self.gitViewModel.fetchGit()
        
        gitTableView.dataSource = self.dataSource
        gitTableView.delegate = self
        
        gitViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.gitTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List Git", wc.name as Any)
                }
                
            }
        })
    }
    
    // MARK: Constrains
    func setup_Constrains_gitTableView() {
        view.addSubview(gitTableView)
        
        gitTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
}



extension GitViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gitTouched = self.gitViewModel.dataSource?.data.value[indexPath.row]
        print("Git selected ", gitTouched!.name as Any)
        
        
        var vc = UIViewController()
        
        switch gitTouched?.name {
        case Title.Git.base:
            vc = GitBaseViewController()
        case Title.Git.advance:
            vc = iOSFrameworksViewController()
        default:
            vc = UIElementsViewController()
        }
        
        self.navigationController!.pushViewController(vc, animated: true)
    }
}
