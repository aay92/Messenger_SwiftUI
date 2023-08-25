//
//  User.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 25.08.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_USER = User(
        fullName: "Bruce Wayne",
        email: "batman@mail.ru",
        profileImageUrl: "user")
}
