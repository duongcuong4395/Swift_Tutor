//
//  ViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation



// https://benoitpasquier.com/ios-swift-mvvm-pattern/
/*
 First, to be able to bind values from our ViewModel to View, we need element with an observable pattern. In iOS, we could use KVO pattern to add and remove observers, but I think we can do a bit better with “didSet” observer.

 Let’s remember that we want to execute a specific code overtime that a value has changed. We can also assume that our object can have multiple observers that are waiting for updates.

 To do so, I created a class keeping a dictionary of observers and their code (here a closure) that we want to execute when updated. Here what it looks like.
 */

import Foundation

typealias CompletionHandler = (() -> Void)
class DynamicValue<T> {

    var value : T {
        didSet {
            self.notify()
        }
    }

    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    

    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }

    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }

    private func notify() {
        observers.forEach({ $0.value() })
    }

    deinit {
        observers.removeAll()
    }
}

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
