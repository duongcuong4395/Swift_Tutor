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


class UIElementsViewController: UIViewController {
    
    let uiElementTableView = UIElementTableView()
    
    let dataSource = UIElementDataSource()
    lazy var uiElementViewModel : UIElementViewModel = {
        let uiElementViewModel = UIElementViewModel(dataSource: dataSource)
        return uiElementViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Category.uiElement
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
        
        self.uiElementViewModel.fetchComponent()
        
        uiElementTableView.dataSource = self.dataSource
        uiElementTableView.delegate = self
        
        uiElementViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.uiElementTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List Components", wc.name as Any)
                }
                
            }
        })
    }
    
    // MARK: Constrains
    func setup_Constrains_setup_componentTableView() {
        view.addSubview(uiElementTableView)
        
        uiElementTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
}



extension UIElementsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let component = self.uiElementViewModel.dataSource?.data.value[indexPath.row]
        print("Component selected ", component!.name as Any)
        
        let comptTutorialViewController = ComptTutorialViewController()
        comptTutorialViewController.comptTutorialViewModel.compSelected = component!
        
        switch component?.name {
        case Title.UIElement.button:
            comptTutorialViewController.comptTutorialViewModel.exampleController = ButtonDemoController()
        case Title.UIElement.toolBar:
            comptTutorialViewController.comptTutorialViewModel.exampleController = ToolBarViewController()
        case Title.UIElement.textField:
            comptTutorialViewController.comptTutorialViewModel.exampleController = TextFieldDemoController()
        case Title.UIElement.tabBar:
            comptTutorialViewController.comptTutorialViewModel.exampleController = TabBarController()
        case Title.UIElement.label:
            comptTutorialViewController.comptTutorialViewModel.exampleController = LabelDemoController()
        default:
            comptTutorialViewController.comptTutorialViewModel.exampleController = ButtonDemoController()
        }
        
        
        let navigationController = UINavigationController(rootViewController: comptTutorialViewController)
        
        self.present(navigationController, animated: true, completion: nil)
    }
}
