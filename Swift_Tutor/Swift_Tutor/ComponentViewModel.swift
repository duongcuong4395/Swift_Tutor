//
//  ComponentViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit

class ComponentViewModel: ItemsViewModel<ComponentModel> {
   
    let buttonModel = ComponentModel(name: Title.Component.button, image: Image.Component.button)

    override init(dataSource : GenericDataSource<ComponentModel>?) {
        super.init(dataSource: dataSource)
        self.listModel.append(buttonModel)
    }

    func fetchCategory() {
        self.dataSource?.data.value = self.listModel
    }
}


class ListComponentDataSource : GenericDataSource<ComponentModel>, UITableViewDataSource {
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

extension ListComponentDataSource : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let component = self.data.value[indexPath.row]
        print("Component name selected ", component.name as Any)
        print("Component image selected ", component.image as Any)
    }
}
