//
//  ComptTutorialViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit
import SnapKit


class ComptTutorialViewController: UIViewController {
    
    let uiFrameworkView = UIFrameworkView()
    
    let comptTutorialTableView = ComptTutorialTableView()
    
    let dataSource = ListComptTutorialDataSource()
    lazy var comptTutorialViewModel : ComptTutorialViewModel = {
        let comptTutorialViewModel = ComptTutorialViewModel(dataSource: dataSource)
        return comptTutorialViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Comp_Button_Tutor"
        self.view.backgroundColor = .white
        
        setup_View()
        
    }
    
    
    func setup_View() {
        setup_Constrains_uiFrameworkView()
        setup_Constrains_comptTutorialTableView()
        
        setup_comptTutorialTableView()
    }
    
    // MARK: Constrains
    
    func setup_Constrains_uiFrameworkView() {
        view.addSubview(uiFrameworkView)
        
        uiFrameworkView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(1)
            make.leading.equalTo(self.view.snp.leading).offset(1)
            make.trailing.equalTo(self.view.snp.trailing).offset(-1)
            make.height.equalTo(450)
        }
    }
    
    func setup_Constrains_comptTutorialTableView() {
        view.addSubview(comptTutorialTableView)
        
        comptTutorialTableView.snp.makeConstraints { (make) in
            make.top.equalTo(uiFrameworkView.snp.bottom).offset(0)
            make.leading.equalTo(self.view.snp.leading).offset(1)
            make.trailing.equalTo(self.view.snp.trailing).offset(-1)
            make.bottom.equalTo(self.view.snp.bottom).offset(1)
        }
    }
    
    // MARK: Event
    
    func setup_comptTutorialTableView() {
        self.comptTutorialViewModel.fetchTutorial()
        
        comptTutorialTableView.dataSource = self.dataSource
        comptTutorialTableView.delegate = self
        
        comptTutorialViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.comptTutorialTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print(wc.name as Any)
                }
                
            }
        })
    }
}


extension ComptTutorialViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let compTutor = self.comptTutorialViewModel.dataSource?.data.value[indexPath.row]
        print("compTutor name selected ", compTutor!.name as Any)
        print("compTutor image selected ", compTutor!.image as Any)
        
        switch compTutor!.name {
            case Title.Tutorial.documentation:
                let vc = CompdocsViewController()
                self.navigationController!.pushViewController(vc, animated: true)
            case Title.Tutorial.example:
                let vc = ComptExampleViewController()
                self.navigationController!.pushViewController(vc, animated: true)
            case Title.Tutorial.topic:
                let vc = ComptTopicsViewController()
                self.navigationController!.pushViewController(vc, animated: true)
            default:
                print("No case")
        }
        
    }
}
