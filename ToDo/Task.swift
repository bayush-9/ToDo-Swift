//
//  Task.swift
//  ToDo
//
//  Created by Ayush Bharsakle on 17/03/25.
//

import Foundation

enum Importance: String , Codable{
    case important = "Important"
    case unimportant = "Unimportant"
}


struct Task : Hashable, Codable , Identifiable{
    var id : Int
    var title : String
    var description : String
    var tag : Importance
}
