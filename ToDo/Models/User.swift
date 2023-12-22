//
//  User.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
