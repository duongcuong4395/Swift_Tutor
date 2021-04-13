//
//  CategoryViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/18/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit

class CategoryViewModel: ItemsViewModel<CategoryModel> {
    
    let component = CategoryModel(name: Title.Category.uiElement, image: Image.Category.uiElement, links: [""])
    let iosFrameworksModel = CategoryModel(name: Title.Category.iosFrameworks, image: Image.Category.iosFrameworks, links: [""])

    override init(dataSource : GenericDataSource<CategoryModel>?) {
        super.init(dataSource: dataSource)
        
        self.listModel.append(component)
        self.listModel.append(iosFrameworksModel)
    }

    func fetchCategory() {
        
        self.dataSource?.data.value = self.listModel
    }
}


class ListCategoryDataSource : GenericDataSource<CategoryModel>, UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.category, for: indexPath) as! CategoryTableViewCell

        let category = self.data.value[indexPath.row]
        cell.nameLabel.text = category.name
        cell.imageUIImage.image = UIImage(named: category.image!)
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
