//
//  NetworksViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import UIKit

class NetworksViewModel: ItemsViewModel<NetworksModel> {
    
    let urlSessionModel = NetworksModel(name: Title.Network.urlSession, image: Image.Network.urlSession, links: [""])
    let alamofireModel = NetworksModel(name: Title.Network.alamofire, image: Image.Network.alamofire, links: [""])

    override init(dataSource : GenericDataSource<NetworksModel>?) {
        super.init(dataSource: dataSource)
        
        self.listModel.append(urlSessionModel)
        self.listModel.append(alamofireModel)
    }

    func fetchData() {
        self.dataSource?.data.value = self.listModel
    }
}


class NetworksDataSource : GenericDataSource<NetworksModel>, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.network, for: indexPath) as! NetworksTableViewCell

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
