//
//  SampleData.swift
//  Share-IT2
//
//  Created by David Chen on 5/7/15.
//  Copyright (c) 2015 David Chen. All rights reserved.
//

import Foundation

let userList1 = [ User(fName:"Bill", lName:"Evans", identification: 4),
    User(fName: "Oscar", lName: "Peterson", identification: 5),
    User(fName: "Dave", lName: "Brubeck", identification: 2) ]


let userList2 = [ User(fName:"Colins", lName:"Evans", identification: 4),
    User(fName: "Michael", lName: "Peterson", identification: 5),
    User(fName: "Zeb", lName: "Brubeck", identification: 2) ]


var roomsList = [Room(vtitle:"room1", vid:000001, vuserlist:userList1), Room(vtitle:"room2", vid:000002, vuserlist:userList2)]
