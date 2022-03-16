//
//  HomeViewModel.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import Foundation

class HomeListViewModel {
    
    var tableDataSource : Observable<[HomeViewModel]> = Observable([HomeViewModel]())
    
    var selectedObject: (People)->() = { _ in }
    
    var shouldHideProgress = false
    
    init(){
        self.getAppData() {
            self.prepareData()
        }
    }
    
    private func getAppData(completion : @escaping () -> ()){
        DataGenerator.getPeople { peopleList in
            self.tableDataSource.value = peopleList.compactMap({
                HomeViewModel($0)
            })
            self.shouldHideProgress = true
            completion()
        }
    }
    
    private func prepareData(){
        
    }
    
    func peopleAtIndex(_ index : Int) -> HomeViewModel {
        if let homeVC = self.tableDataSource.value?[index] {
            return homeVC
        }
        return HomeViewModel(People())
    }
    
    func numberOfRowsInSection() -> Int{
        return tableDataSource.value?.count ?? 0
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

