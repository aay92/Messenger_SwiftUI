//
//  InboxService.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 02.09.2023.
//

import Foundation
import Firebase

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirebaseConstants
            .messageCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges
                .filter({ $0.type == .added || $0.type == .modified })
                    ///Если что-то будте добавлено и изменено , мы получаем данные
            else  { return }
            
            self.documentChanges = changes
        }
    }
}
