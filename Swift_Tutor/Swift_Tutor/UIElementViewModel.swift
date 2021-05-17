//
//  ComponentViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit

class UIElementViewModel: ItemsViewModel<UIElementModel> {
   
    let buttonModel = UIElementModel(name: Title.UIElement.button, image: Image.UIElement.button, links: ["https://developer.apple.com/documentation/uikit/uibutton"])
    let labelModel = UIElementModel(name: Title.UIElement.label, image: Image.UIElement.label, links: ["https://developer.apple.com/documentation/uikit/uilabel"])
    let textFieldModel = UIElementModel(name: Title.UIElement.textField, image: Image.UIElement.textField, links: ["https://developer.apple.com/documentation/uikit/uitextfield"])
    let toolBarModel = UIElementModel(name: Title.UIElement.toolBar, image: Image.UIElement.toolBar, links: ["https://developer.apple.com/documentation/uikit/uitoolbar"])
    let tabBarModel = UIElementModel(name: Title.UIElement.tabBar, image: Image.UIElement.tabBar, links: ["https://developer.apple.com/documentation/uikit/uitabbar"])

    override init(dataSource : GenericDataSource<UIElementModel>?) {
        super.init(dataSource: dataSource)
        self.listModel.append(buttonModel)
        self.listModel.append(labelModel)
        self.listModel.append(textFieldModel)
        self.listModel.append(toolBarModel)
        self.listModel.append(tabBarModel)
    }

    func fetchComponent() {
        self.dataSource?.data.value = self.listModel
    }
}


class UIElementDataSource : GenericDataSource<UIElementModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.uiElement, for: indexPath) as! UIElementCell

        let component = self.data.value[indexPath.row]
        cell.nameLabel.text = component.name
        cell.imageUIImage.image = UIImage(named: component.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObjTemp = self.data.value[sourceIndexPath.item]
        self.data.value.remove(at: sourceIndexPath.item)
        self.data.value.insert(moveObjTemp, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            self.data.value.remove(at: indexPath.row)
        }
    }
}

