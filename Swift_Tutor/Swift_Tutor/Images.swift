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
}
