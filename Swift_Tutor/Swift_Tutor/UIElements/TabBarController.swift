//
//  TabBarController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/1/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

enum TabBar_Properties {
    case backgroundImage
    case items
    case selectedItem
}

class TabBarController:  UITabBarController, UITabBarControllerDelegate {
    
    var tabBarBackgroundImageController = TabBarBackgroundImageController()
    var tabBarItemsController = TabBarItemsController()
    var tabBarSelectedItemController = TabBarSelectedItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // homeViewController = HomeViewController()
        // secondViewController = SecondViewController()
        // actionViewController = ActionViewController()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBarBackgroundImageController.tabBarItem.image = UIImage(named: "background")
        tabBarBackgroundImageController.tabBarItem.selectedImage = UIImage(named: "background")
        tabBarItemsController.tabBarItem.image = UIImage(named: "item")
        tabBarItemsController.tabBarItem.selectedImage = UIImage(named: "item")
        tabBarSelectedItemController.tabBarItem.image = UIImage(named: "itemSelected")
        tabBarSelectedItemController.tabBarItem.selectedImage = UIImage(named: "itemSelected")
        
        viewControllers = [tabBarBackgroundImageController,tabBarItemsController,tabBarSelectedItemController]
        //
        for tabBarItem in tabBar.items! {
          tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    //MARK: UITabbar Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        /*
      if viewController.isKind(of: ActionViewController.self) {
         let vc =  ActionViewController()
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated: true, completion: nil)
         return false
      }
        */
      return true
    }
    
}
