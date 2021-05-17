//
//  GitBaseViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit
import SnapKit


class GitBaseViewController: UIViewController {
    
    let gitBaseTableView = GitBaseTableView()
    
    let dataSource = GitBaseDataSource()
    lazy var gitBaseViewModel : GitBaseViewModel = {
        let gitBaseViewModel = GitBaseViewModel(dataSource: dataSource)
        return gitBaseViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Git.base
        
        setupViews()
    }
    
    func setupViews() {
        setupGitBaseTableView()
    }
    
    func setupGitBaseTableView() {
        setupConstrainsGitBaseTableView()
        
        self.gitBaseViewModel.fetchGit()
        
        gitBaseTableView.dataSource = self.dataSource
        gitBaseTableView.delegate = self
        
        gitBaseViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.gitBaseTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List Git", wc.name as Any)
                }
                
            }
        })
    }
    
    // MARK: Constrains
    func setupConstrainsGitBaseTableView() {
        view.addSubview(gitBaseTableView)
        
        gitBaseTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
}


extension GitBaseViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let gitBaseTouched = self.gitBaseViewModel.dataSource?.data.value[indexPath.row] {
            //let comptTutorialViewController = ComptTutorialViewController(nameFillter: Title.Tutorial.example)
            //comptTutorialViewController.comptTutorialViewModel.compSelected = gitBaseTouched!

            let comptTutorialViewController: Any
            
            comptTutorialViewController = ComptTutorialViewController(nameFillter: Title.Tutorial.example, compSelected: gitBaseTouched, exampleController: UIViewController())
            
            
            let navigationController = UINavigationController(rootViewController: comptTutorialViewController as! UIViewController)
            
            self.present(navigationController, animated: true, completion: nil)
        }
        
    }
}
