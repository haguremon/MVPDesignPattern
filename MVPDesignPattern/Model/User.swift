//
//  User.swift
//  MVPDesignPattern
//
//  Created by IwasakIYuta on 2021/07/23.
//

import Foundation
struct User: Codable { //public typealias Codable = Encodable & Decodable
    let name: String
    let email: String
    let username: String
}
