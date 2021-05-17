//
//  NetworkViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {

    let networksTableView = NetworksTableView()
    
    let dataSource = NetworksDataSource()
    lazy var networksViewModel : NetworksViewModel = {
        let networksViewModel = NetworksViewModel(dataSource: dataSource)
        return networksViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Category.networks
        
        setupViews()
    }
    
    
    
    private func setupViews() {
        setupNetworksTableView()
    }
    
    private func setupNetworksTableView() {
        setupConstrainsNetworksTableView()
        
        self.networksViewModel.fetchData()
        
        self.networksTableView.dataSource = self.dataSource
        self.networksTableView.delegate = self
        
        networksViewModel.dataSource?.data.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.networksTableView.reloadData()
            
            if self!.dataSource.data.value.count > 0 {
                for wc in self!.dataSource.data.value {
                    print("List networks ", wc.name as Any)
                }
                
            }
        })
    }
    
    func setupConstrainsNetworksTableView() {
        view.addSubview(networksTableView)
        
        networksTableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
}

extension NetworkViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let networksSelected = self.networksViewModel.dataSource?.data.value[indexPath.row] {
            print("ios networks selected ", networksSelected.name as Any)
            
            let comptTutorialViewController: Any
            
            switch networksSelected.name {
            case Title.Network.urlSession:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: networksSelected, exampleController: URLSessionViewController())
            case Title.Network.alamofire:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: networksSelected, exampleController: AlamofireViewController())
            default:
                comptTutorialViewController = ComptTutorialViewController(nameFillter: "", compSelected: networksSelected, exampleController: URLSessionViewController())
            }
            
            let navigationController = UINavigationController(rootViewController: comptTutorialViewController as! UIViewController)
            
            self.present(navigationController, animated: true, completion: nil)
        }
        
    }
    
}
