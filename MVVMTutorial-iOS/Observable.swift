//
//  Observable.swift
//  MVVMTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/23.
//

import Foundation

class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        self.listener = closure
        listener?(value)
    }
}

