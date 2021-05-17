//
//  CompdocsViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/23/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit
import WebKit

class CompdocsViewController: UIViewController, WKUIDelegate {
    
    var webView = WKWebView()
    
    let compdocsViewModel = CompdocsViewModel()
    
    override func loadView() {
        self.title = Title.Tutorial.documentation
        
        compdocsViewModel.dataSource.value.docsLink = compdocsViewModel.dataSource.value.docsLink == "" ? "https://forums.swift.org" : compdocsViewModel.dataSource.value.docsLink;
        
        if(compdocsViewModel.dataSource.value.docsLink.verifyUrl() == true) {
                let webConfig = WKWebViewConfiguration()
                webView = WKWebView(frame: .zero, configuration: webConfig)
                webView.uiDelegate = self
                view = webView
            
            
            //print("doc_Link selected ", compdocsViewModel.dataSource.value.docsLink)
            
            if let url = URL(string: compdocsViewModel.dataSource.value.docsLink) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
            
            
            //webView.loadHTMLString("https://developer.apple.com/documentation/uikit/uibutton", baseURL: nil)
        }
        
    }
}



