//
//  People.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import Foundation

struct People {
    var name : String
    var profileImage : String
    var description : String
    
    init(name: String = "", profileImage: String = "" , description : String = "") {
        self.name = name
        self.profileImage = profileImage
        self.description = description
    }
}
