//
//  AlamofireViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/25/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import UIKit
import SnapKit


class AlamofireViewController: UIViewController {
    
    let imageByURL = UIImageView()
    let changeImageButton = UIButton()
    
    lazy var catViewModel : CatViewModel = {
        let catViewModel = CatViewModel()
        return catViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.Network.alamofire

        setupViews()
        setupEvents()
        GetDataFromAPI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        catViewModel.process()
    }
    
    
    func GetDataFromAPI() {
        catViewModel.dataSourceCat?.addAndNotify(observer: self, completionHandler: { [weak self] in
            self!.loadImage()
        })
        
    }
    
    func setupViews() {
        setupConstrainsImageByURL()
        setupConstrainsChangeImageButton()
        setupUIChangeImageButton()
        
    }
    
    func setupEvents() {
        changeImageButton.addTarget(self, action: #selector(changeImage), for: .touchDown)
    }
    
    
    
    func loadImage() {
        //if self.catViewModel.dataSource?.data.value[0].url == nil { return }
//        print("Imgar url \(self.catViewModel.dataSourceCat?.value)")
        imageByURL.downloaded(from: (self.catViewModel.dataSourceCat?.value.url)!)
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
        catViewModel.process()
        //urlSessionViewModel.getDataByGetRequest()
    }
}
