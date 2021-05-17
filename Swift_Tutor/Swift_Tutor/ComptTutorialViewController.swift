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
        
        title = comptTutorialViewModel.compSelected.name
        self.view.backgroundColor = .white

    }
    
    
    init(nameFillter: String, compSelected: ItemModel, exampleController: UIViewController) {
        
        super.init(nibName: nil, bundle: nil)
        
        comptTutorialViewModel.filterBy(name: nameFillter)
        comptTutorialViewModel.setupCompSelectedBy(itemModel: compSelected)
        
        comptTutorialViewModel.setupExampleControllerBy(uiViewController: exampleController)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    private func setupView() {
        setupConstrainsUIFrameworkView()
        setupConstrainsComptTutorialTableView()
        
        setupComptTutorialTableView()
    }
    
    // MARK: Constrains
    
    private func setupConstrainsUIFrameworkView() {
        view.addSubview(uiFrameworkView)
        
        uiFrameworkView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(1)
            make.leading.equalTo(self.view.snp.leading).offset(1)
            make.trailing.equalTo(self.view.snp.trailing).offset(-1)
            make.height.equalTo(450)
        }
    }
    
     private func setupConstrainsComptTutorialTableView() {
        view.addSubview(comptTutorialTableView)
        
        comptTutorialTableView.snp.makeConstraints { (make) in
            make.top.equalTo(uiFrameworkView.snp.bottom).offset(0)
            make.leading.equalTo(self.view.snp.leading).offset(1)
            make.trailing.equalTo(self.view.snp.trailing).offset(-1)
            make.bottom.equalTo(self.view.snp.bottom).offset(1)
        }
    }
    
    // MARK: Event
    
    private func setupComptTutorialTableView() {
        self.comptTutorialViewModel.fetchTutorial()
        
        comptTutorialTableView.dataSource = self.dataSource
        comptTutorialTableView.delegate = self
        
        comptTutorialViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.comptTutorialTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List component tutorial", wc.name as Any)
                }
                
            }
        })
    }
    
}


extension ComptTutorialViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let compTutor = self.comptTutorialViewModel.dataSource?.data.value[indexPath.row] {
            print("compTutor selected ", compTutor.name as Any)
            
            switch compTutor.name {
                case Title.Tutorial.documentation:
                    let vc = CompdocsViewController()
                    vc.compdocsViewModel.updateLinks(link: comptTutorialViewModel.compSelected.links[0])
                    self.navigationController!.pushViewController(vc, animated: true)
                case Title.Tutorial.example:
                    self.navigationController!.pushViewController(comptTutorialViewModel.exampleController, animated: true)
                case Title.Tutorial.topic:
                    let vc = ComptTopicsViewController()
                    self.navigationController!.pushViewController(vc, animated: true)
                default:
                    print("No case")
            }
        }
        
    }
}
