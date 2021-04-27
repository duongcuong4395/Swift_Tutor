//
//  ComptTutorialViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation



import UIKit

class ComptTutorialViewModel: ItemsViewModel<ComptTutorialModel> {
    
    let documentationModel = ComptTutorialModel(name: Title.Tutorial.documentation, image: Image.Tutorial.documentation, links: [""])
    //let topicModel = ComptTutorialModel(name: Title.Tutorial.topic, image: Image.Tutorial.topic)
    let exampleModel = ComptTutorialModel(name: Title.Tutorial.example, image: Image.Tutorial.example, links: [""])

    var compSelected = ItemModel(name: "", image: "", links: [""])
    var exampleController = UIViewController()
    
    
    override init(dataSource : GenericDataSource<ComptTutorialModel>?) {
        super.init(dataSource: dataSource)
        
        self.listModel.append(documentationModel)
        self.listModel.append(exampleModel)
        
        self.dataSource?.data.value = self.listModel
    }

    func fetchTutorial() {
        
        //self.dataSource?.data.value = self.listModel
    }
    
    func setupCompSelectedBy(itemModel: ItemModel) {
        compSelected = itemModel
    }
    
    func setupExampleControllerBy(uiViewController: UIViewController) {
        if (uiViewController == UIViewController()) {return}
        
        exampleController = uiViewController
    }
    
    func filterBy(name: String) {
        if name == "" { return }
        self.dataSource?.data.value = (self.dataSource?.data.value.filter { $0.name == name })!

    }
}



class ListComptTutorialDataSource : GenericDataSource<ComptTutorialModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.compTutorial, for: indexPath) as! ComptTutorialTableViewCell

        let compTutor = self.data.value[indexPath.row]
        cell.nameLabel.text = compTutor.name
        cell.imageUIImage.image = UIImage(named: compTutor.image)
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
