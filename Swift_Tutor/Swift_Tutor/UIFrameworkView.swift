//
//  UIFrameworkView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class UIFrameworkView : UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "UI Framework"
        return label
    }()
    
    var swiftUiView = VerticalItemView()
    var uiKitView = VerticalItemView()
    
    
    var uiFrameworkViewModel = UIFrameworkViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupEvents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        // setup Constrains
        setupConstrainsTitleLabel()
        
        setupConstrainsSwiftUiView()
        setupConstrainsUIKitView()
        
        self.uiFrameworkViewModel.fetchUIFramework()
        self.uiFrameworkViewModel.dataSource.addAndNotify(observer: self, completionHandler: {
            // touch ui framework
            self.ChangeUiFrameWork()
        })
        
    }
    
    // MARK: Constrains
    
    func setupConstrainsTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(1)
            make.leading.equalTo(snp.leading).offset(1)
            make.trailing.equalTo(snp.trailing).offset(-1)
        }
    }
    
    func setupConstrainsSwiftUiView() {
        
        self.addSubview(swiftUiView)
        
        swiftUiView.nameLabel.text = "Swift UI"
        swiftUiView.imageUIImage.image = UIImage(named: Image.UiFramework.swiftUI)
        
        swiftUiView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(1)
            make.leading.equalTo(self.snp.leading).offset(1)
            make.trailing.equalTo(self.snp.centerX).offset(-1)
            make.bottom.equalTo(self.snp.bottom).offset(-1)
        }
    }
    
    func setupConstrainsUIKitView() {
        
        self.addSubview(uiKitView)
        
        uiKitView.nameLabel.text = "UIKit"
        uiKitView.imageUIImage.image = UIImage(named: Image.UiFramework.uiKit)
        
        uiKitView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(1)
            make.leading.equalTo(self.snp.centerX).offset(1)
            make.trailing.equalTo(self.snp.trailing).offset(-1)
            make.bottom.equalTo(self.snp.bottom).offset(-1)
        }
    }
    
    // MARK: Events
    
    private func setupEvents() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.setup_swiftUiView_Touch))
        self.swiftUiView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.setup_uiKitView_Touch))
        self.uiKitView.addGestureRecognizer(gesture2)
    }
    
    @objc func setup_swiftUiView_Touch() {
        self.uiFrameworkViewModel.changeUIFramework(uiName: Title.uiFramework.swiftUI)
    }
    
    @objc func setup_uiKitView_Touch() {
        self.uiFrameworkViewModel.changeUIFramework(uiName: Title.uiFramework.uiKit)
    }
    
    func ChangeUiFrameWork() {
        for item in (self.uiFrameworkViewModel.dataSource.value) {
            if item.name == Title.uiFramework.uiKit {
                uiKitView.alpha = item.selected ? 1 : 0.3
            }
            if item.name == Title.uiFramework.swiftUI {
                swiftUiView.alpha = item.selected ? 1 : 0.3
            }
        }
    }
}
