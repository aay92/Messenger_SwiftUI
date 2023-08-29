//
//  User.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 25.08.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    
    @DocumentID var uid: String?///id из firestore
    
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }

}

extension User {
    static let MOCK_USER = User(
        fullName: "Bruce Wayne",
        email: "batman@mail.ru",
        profileImageUrl: "user")
}
