//
//  URLSessionViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import SnapKit
import UIKit

class URLSessionViewController: UIViewController {

    let imageByURL = UIImageView()
    let changeImageButton = UIButton()
    
    
    lazy var urlSessionViewModel : URLSessionViewModel = {
        let urlSessionViewModel = URLSessionViewModel()
        return urlSessionViewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Network.urlSession
        
        GetDataFromAPI()
        setupViews()
        setupEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        urlSessionViewModel.getDataByGetRequest()
    }
    
    func setupViews() {
        setupConstrainsImageByURL()
        setupConstrainsChangeImageButton()
        setupUIChangeImageButton()
        
    }
    
    func setupEvents() {
        changeImageButton.addTarget(self, action: #selector(changeImage), for: .touchDown)
    }

    func GetDataFromAPI() {
        urlSessionViewModel.dataSourceDog?.addAndNotify(observer: self, completionHandler: { [weak self] in
            self!.loadImage()
        })
        
    }
    
    func loadImage() {
        if self.urlSessionViewModel.dataSourceDog?.value.message == nil { return }
        
        imageByURL.downloaded(from: (self.urlSessionViewModel.dataSourceDog?.value.message)!)
    }
    
    func setupConstrainsImageByURL() {
        view.addSubview(imageByURL)
        
        imageByURL.layer.cornerRadius = 30
        
        imageByURL.layer.shadowColor = UIColor.black.cgColor
        imageByURL.layer.shadowOffset = CGSize(width: 2.0, height: 3.5)
        imageByURL.layer.shadowOpacity = 1.0
        imageByURL.layer.shadowRadius = 3
        
        imageByURL.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.leading.trailing.equalTo(self.view)
            make.height.equalTo(300)
        }
    }
    
    
    func setupConstrainsChangeImageButton() {
        view.addSubview(changeImageButton)
        
        changeImageButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageByURL.snp.bottom).offset(7)
            make.leading.trailing.equalTo(self.view)
        }
    }
    
    func setupUIChangeImageButton() {
        changeImageButton.layer.cornerRadius = 10
        changeImageButton.backgroundColor = .brown
        changeImageButton.setTitle("Change Image", for: .normal)
        changeImageButton.borderWith(width: 2, color: UIColor.black.cgColor)
        changeImageButton.shadowWith(color: UIColor.brown.cgColor, offset: CGSize(width: 0.0, height: 3.0), opacity: 1.0, radius: 2)
    }
    
    @objc func changeImage() {
        urlSessionViewModel.getDataByGetRequest()
    }
}
