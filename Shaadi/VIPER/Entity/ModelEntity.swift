//
//  ModelEntity.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import UIKit

struct ShaadiList : Codable {
    let results : [Results]?
    let info : Info?
}

struct Results : Codable {
    let gender : String?
    let name : Name?
    let email : String?
    let phone : String?
    let cell : String?
    let id : Id?
    let picture : Picture?
}

struct Name : Codable {
    let title : String?
    let first : String?
    let last : String?
}

struct Id : Codable {
    let name : String?
    let value : String?
}

struct Picture : Codable {
    let large : String?
    let medium : String?
    let thumbnail : String?
}

struct Info : Codable {
    let seed : String?
    let results : Int?
    let page : Int?
    let version : String?
}
