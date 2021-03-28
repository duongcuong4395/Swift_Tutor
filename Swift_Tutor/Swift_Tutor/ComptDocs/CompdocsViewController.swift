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
    
    override func loadView() {
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Documentation"
        
        let url = URL(string: "https://developer.apple.com/documentation/uikit/uibutton")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //webView.loadHTMLString("https://developer.apple.com/documentation/uikit/uibutton", baseURL: nil)
    }
}



