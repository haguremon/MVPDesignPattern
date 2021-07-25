//
//  User.swift
//  MVPDesignPattern
//
//  Created by IwasakIYuta on 2021/07/23.
//

import Foundation
//public typealias Codable = Encodable & Decodableエンコードもデコードもどっちも行けまっせ
struct User: Codable {
    let name: String
    let username: String
    let email: String
}
