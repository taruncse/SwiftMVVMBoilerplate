//
//  HomeViewModel.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import Foundation

class HomeListViewModel: ViewModelProtocol {
    
    var title: String = Constants.HOME_TITLE
    
    var dataList : Observable<[HomeViewModel]> = Observable([HomeViewModel]())
        
    var shouldHideProgress = false
    
    init(){
        self.getData() {
            self.prepareData()
        }
    }
    
    func getData(completion : @escaping () -> ()){
        DataGenerator.getPeople { peopleList in
            self.dataList.value = peopleList.compactMap({
                HomeViewModel($0)
            })
            self.shouldHideProgress = true
            completion()
        }
    }
    
    func prepareData(){
        
    }
    
    func valueAtIndex(_ index : Int) -> HomeViewModel {
        if let homeVC = self.dataList.value?[index] {
            return homeVC
        }
        return HomeViewModel(People())
    }
    
    func numberOfRowsInSection() -> Int{
        return dataList.value?.count ?? 0
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
