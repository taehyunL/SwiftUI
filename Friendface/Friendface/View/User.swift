//
//  Friendface.swift
//  Friendface
//
//  Created by 이태현 on 2022/03/19.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

// MARK: - Friend
struct Friend: Codable, Identifiable {
    let id, name: String
}
