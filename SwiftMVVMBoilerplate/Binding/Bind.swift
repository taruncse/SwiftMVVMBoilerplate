//
//  Bind.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 16/3/22.
//

import Foundation

class Observable<T>{
    
    private var listeners : ((T?)-> Void)?
    
    var value: T? {
        didSet {
            listeners?(value)
        }
    }
    
    init( _ value: T?){
        self.value = value
    }
    
    func bind(_ listener : @escaping (T?) -> Void){
        listener(value)
        self.listeners = listener
    }
}
