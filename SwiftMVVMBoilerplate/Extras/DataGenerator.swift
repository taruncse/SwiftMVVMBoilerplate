//
//  DataGenerator.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import Foundation

struct DataGenerator {
    
    static func getPeople(completion: @escaping ([People])->()){
        var peopleList = [People]()
        for i in 0...5 {
            let people = People(name : "Name \(i)", profileImage : "image\(i)", description : "Hi my index number is \(i) And I am from Khulna")
            peopleList.append(people)
        }
        completion(peopleList)
    }
    
}
