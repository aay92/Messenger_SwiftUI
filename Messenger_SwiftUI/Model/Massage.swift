//
//  Massage.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 31.08.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Massage: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageTaxt: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId ///с кем общаемся
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid 
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString() ///dateValue возващает дату
    }
}
