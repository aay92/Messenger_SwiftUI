//
//  Constants.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 02.09.2023.
//

import Foundation
import Firebase

struct FirebaseConstants {
    static let userCollection = Firestore.firestore().collection("users")
    static let messageCollection = Firestore.firestore().collection("messages")
}
