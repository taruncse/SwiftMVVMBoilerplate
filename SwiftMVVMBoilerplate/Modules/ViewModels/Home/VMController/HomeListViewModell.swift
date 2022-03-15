//
//  HomeViewModel.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import Foundation

class HomeListViewModel {
    
    private var tableDataSource : [People] = [People]()
    
    var reloadTable: ()->() = {}
    var selectedObject: (People)->() = { _ in }
    
    init(){
        self.getAppData() {
            self.prepareData()
            self.reloadTable()
        }
    }
    
    private func getAppData(completion : @escaping () -> ()){
        DataGenerator.getPeople { peopleList in
            self.tableDataSource = peopleList
            completion()
        }
    }
    
    private func prepareData(){
        
    }
    
    func peopleAtIndex(_ index : Int) -> HomeViewModel {
        let people = self.tableDataSource[index]
        return HomeViewModel(people)
    }
    
    func numberOfRowsInSection() -> Int{
        return tableDataSource.count
    }
    
}

struct HomeViewModel{
    private let people : People
    
    init(_ people : People){
        self.people = people
    }

    var name : String {
        return self.people.name
    }
    var profileImage : String {
        return self.people.profileImage
    }
    var description : String {
        return self.people.description
    }
}

