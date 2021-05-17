//
//  iOSFrameworksViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/6/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

class IOSFrameworksViewModel: ItemsViewModel<IOSFrameworksModel> {
    
    let coreAnimationModel = IOSFrameworksModel(name: Title.IOSFrameworks.coreAnimation, image: Image.iosFrameworks.coreAnimation, links: [""])
    let coreDataModel = IOSFrameworksModel(name: Title.IOSFrameworks.coreData, image: Image.iosFrameworks.coreData, links: [""])

    override init(dataSource : GenericDataSource<IOSFrameworksModel>?) {
        super.init(dataSource: dataSource)
        
        self.listModel.append(coreAnimationModel)
        self.listModel.append(coreDataModel)
    }

    func fetchData() {
        self.dataSource?.data.value = self.listModel
    }
}


class IOSFrameworksDataSource : GenericDataSource<IOSFrameworksModel>, UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.iOSFrameworks, for: indexPath) as! IOSFrameworksCell

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
