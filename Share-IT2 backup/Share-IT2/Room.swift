//
//  Room.swift
//  
//
//  Created by David Chen on 4/15/15.
//
//

import Foundation


class User {
    var id: Int
    var firstName: String
    var lastName: String
    
    
    init(fName: String, lName: String, identification: Int){
        self.firstName = fName
        self.lastName = lName
        self.id = identification
        //super.init()
    }
}

class Room {
    var title: String
    var id: Int
    var userList: [User]
    
    init(vtitle: String, vid: Int, vuserlist: [User]){
        self.title = vtitle
        self.id = vid
        self.userList = vuserlist
    }
}

