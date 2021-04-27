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
        
        setupViews()
    }
    
    
    private func setupViews() {
        setupComponentTableView()
    }
    
    private func setupComponentTableView() {
        setupConstrainsComponentTableView()
        
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
    private func setupConstrainsComponentTableView() {
        view.addSubview(uiElementTableView)
        
        uiElementTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
}



extension UIElementsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let component = self.uiElementViewModel.dataSource?.data.value[indexPath.row] {
            print("Component selected ", component.name as Any)
            
            let comptTutorialViewController: Any
            
            switch component.name {
            case Title.UIElement.button:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: component, exampleController: ButtonDemoController())
            case Title.UIElement.toolBar:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: component, exampleController: ToolBarViewController())
            case Title.UIElement.textField:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: component, exampleController: TextFieldDemoController())
            case Title.UIElement.tabBar:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: component, exampleController: TabBarController())
            case Title.UIElement.label:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: component, exampleController: LabelDemoController())
            default:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: component, exampleController: ButtonDemoController())
            }
            
            
            let navigationController = UINavigationController(rootViewController: comptTutorialViewController as! UIViewController)
            
            self.present(navigationController, animated: true, completion: nil)
        }
        
    }
}
