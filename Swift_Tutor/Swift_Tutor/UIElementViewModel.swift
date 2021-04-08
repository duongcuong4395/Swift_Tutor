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
   
    let buttonModel = UIElementModel(name: Title.Component.button, image: Image.Component.button)
    let labelModel = UIElementModel(name: Title.Component.label, image: Image.Component.label)
    let textFieldModel = UIElementModel(name: Title.Component.textField, image: Image.Component.textField)
    let toolBarModel = UIElementModel(name: Title.Component.toolBar, image: Image.Component.toolBar)

    override init(dataSource : GenericDataSource<UIElementModel>?) {
        super.init(dataSource: dataSource)
        self.listModel.append(buttonModel)
        self.listModel.append(labelModel)
        self.listModel.append(textFieldModel)
        self.listModel.append(toolBarModel)
    }

    func fetchComponent() {
        self.dataSource?.data.value = self.listModel
    }
}


class UIElementDataSource : GenericDataSource<UIElementModel>, UITableViewDataSource {
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.component, for: indexPath) as! ComponentTableViewCell

        let component = self.data.value[indexPath.row]
        cell.nameLabel.text = component.name
        cell.imageUIImage.image = UIImage(named: component.image!)
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

extension UIElementDataSource : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let component = self.data.value[indexPath.row]
        print("Component name selected ", component.name as Any)
        print("Component image selected ", component.image as Any)
    }
}
