//
//  Title.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/19/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


class Title {
    
    class Category {
        public static var uiElement = "UI Elements"
        public static var iosFrameworks = "iOS Frameworks"
        public static var git = "Git"
        public static var networks = "Networks"
        
    }
    
    class UIElement {
        public static var button = "Button"
        public static var label = "Label"
        public static var textField = "TextField"
        public static var toolBar = "ToolBar"
        public static var tabBar = "TabBar"
    }
    
    class uiFramework {
        public static var uiKit = "uiKit"
        public static var swiftUI = "swiftUI"
    }
    
    class IOSFrameworks {
        public static var coreAnimation = "Core Animation"
        public static var coreData = "Core Data"
    }
    
    class Tutorial {
        public static var documentation = "Documetation"
        public static var topic = "Topic"
        public static var example = "Example"
    }
    
    class Network {
        public static var urlSession = "URLSession"
        public static var alamofire = "Alamofire"
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
