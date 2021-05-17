//
//  GItBaseViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import UIKit

class GitBaseViewModel: ItemsViewModel<GitBaseModel> {
    
    let gitModel = GitBaseModel(name: Title.Git.Base.git, image: Image.Git.Base.git, links: [""])
    let branchModel = GitBaseModel(name: Title.Git.Base.branch, image: Image.Git.Base.branch, links: ["https://backlog.com/git-tutorial/vn/stepup/stepup1_1.html"])
    let repositoryModel = GitBaseModel(name: Title.Git.Base.repository, image: Image.Git.Base.repository, links: ["https://backlog.com/git-tutorial/vn/stepup/stepup3_1.html", "https://backlog.com/git-tutorial/vn/stepup/stepup3_2.html", "https://backlog.com/git-tutorial/vn/stepup/stepup3_3.html"])
    let tagsModel = GitBaseModel(name: Title.Git.Base.tags, image: Image.Git.Base.tags, links: ["https://backlog.com/git-tutorial/vn/stepup/stepup4_1.html", "https://backlog.com/git-tutorial/vn/stepup/stepup5_1.html", "https://backlog.com/git-tutorial/vn/stepup/stepup5_2.html", "https://backlog.com/git-tutorial/vn/stepup/stepup5_3.html", "https://backlog.com/git-tutorial/vn/stepup/stepup5_4.html"])
    let commitModel = GitBaseModel(name: Title.Git.Base.commit, image: Image.Git.Base.commit, links: ["https://backlog.com/git-tutorial/vn/stepup/stepup6_1.html", "https://backlog.com/git-tutorial/vn/stepup/stepup6_2.html", "https://backlog.com/git-tutorial/vn/stepup/stepup6_3.html", "https://backlog.com/git-tutorial/vn/stepup/stepup6_4.html", "https://backlog.com/git-tutorial/vn/stepup/stepup6_5.html", "https://backlog.com/git-tutorial/vn/stepup/stepup6_6.html", "https://backlog.com/git-tutorial/vn/stepup/stepup7_1.html", "https://backlog.com/git-tutorial/vn/stepup/stepup7_2.html", "https://backlog.com/git-tutorial/vn/stepup/stepup7_3.html", "https://backlog.com/git-tutorial/vn/stepup/stepup7_4.html", "https://backlog.com/git-tutorial/vn/stepup/stepup7_5.html", "https://backlog.com/git-tutorial/vn/stepup/stepup7_6.html"])
    let mergeModel = GitBaseModel(name: Title.Git.Base.merge, image: Image.Git.Base.merge, links: ["https://backlog.com/git-tutorial/vn/stepup/stepup7_7.html", "https://backlog.com/git-tutorial/vn/stepup/stepup6_6.html", "https://backlog.com/git-tutorial/vn/stepup/stepup1_4.html", "https://backlog.com/git-tutorial/vn/stepup/stepup2_4.html"])

    override init(dataSource : GenericDataSource<GitBaseModel>?) {
        super.init(dataSource: dataSource)
        
        self.listModel.append(gitModel)
        self.listModel.append(branchModel)
        self.listModel.append(repositoryModel)
        self.listModel.append(tagsModel)
        self.listModel.append(commitModel)
        self.listModel.append(mergeModel)
    }

    func fetchGit() {
        
        self.dataSource?.data.value = self.listModel
    }
}


class GitBaseDataSource : GenericDataSource<GitBaseModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.Git.base, for: indexPath) as! GitBaseTableViewCell

        let category = self.data.value[indexPath.row]
        cell.nameLabel.text = category.name
        cell.imageUIImage.image = UIImage(named: category.image)
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
