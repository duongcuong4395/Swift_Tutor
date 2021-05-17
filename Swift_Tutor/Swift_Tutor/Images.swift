//
//  Images.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


class Image {
    
    class Category {
        public static var uiElement = "uiElement"
        public static var iosFrameworks = "iosFrameworks"
        public static var git = "git"
        public static var network = "network"
        
    }
    
    class UIElement {
        public static var button = "button"
        public static var label = "label"
        public static var textField = "textField"
        public static var toolBar = "toolBar"
        public static var tabBar = "tabBar"
    }
    
    class UiFramework {
        public static var uiKit = "uiKit"
        public static var swiftUI = "swiftUI"
    }
    
    class iosFrameworks {
        public static var coreAnimation = "coreAnimation"
        public static var coreData = "coreData"
    }
    
    class Tutorial {
        public static var documentation = "documentation"
        public static var topic = "topic"
        public static var example = "example"
    }
    
    class Network {
        public static var urlSession = "urlSession"
        public static var alamofire = "alamofire"
    }
    
    class Git {
        public static var base = "Base"
        public static var advance = "Advance"
        
        class Base {
            public static var git = "Git"
            public static var branch = "Branch"
            public static var repository = "repository"
            public static var tags = "tags"
            public static var commit = "commit"
            public static var merge = "Merge"
        }
        
        class Advance {
            
        }
    }
}
