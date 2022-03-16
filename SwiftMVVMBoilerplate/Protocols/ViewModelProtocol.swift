//
//  ViewModelProtocol.swift
//  SwiftMVVMBoilerplate
//
//  Created by DreamOnline on 17/3/22.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype T
    var dataList : Observable<[T]> {set get}
    var title : String {set get}
    func valueAtIndex(_ index : Int) -> T
    func numberOfRowsInSection() -> Int
    func prepareData()
    func getData(completion : @escaping () -> ())
}
