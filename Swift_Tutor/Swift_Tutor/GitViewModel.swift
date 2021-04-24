//
//  GitViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/15/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import UIKit

class GitViewModel: ItemsViewModel<GitModel> {
    
    let gitBaseModel = GitModel(name: Title.Git.base, image: Image.Git.base, links: [""])
    let gitAdvanceModel = GitModel(name: Title.Git.advance, image: Image.Git.advance, links: [""])

    override init(dataSource : GenericDataSource<GitModel>?) {
        super.init(dataSource: dataSource)
        
        self.listModel.append(gitBaseModel)
        self.listModel.append(gitAdvanceModel)
    }

    func fetchGit() {
        
        self.dataSource?.data.value = self.listModel
    }
}


class GitDataSource : GenericDataSource<GitModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.git, for: indexPath) as! GitTableViewCell

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
