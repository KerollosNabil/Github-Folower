//
//  User.swift
//  Github Folower
//
//  Created by MAC on 11/5/20.
//

import Foundation

struct User:Codable, Hashable {
    
    var login:String
    var avatarUrl:String
    var name:String?
    var bio:String?
    var location:String?
    var publicRepos:Int
    var publicGists:Int
    var htmlUrl:String
    var followers:Int
    var following:Int
    var createdAt:String
    
}
