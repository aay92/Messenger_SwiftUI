//
//  MessageService.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 31.08.2023.
//

import Foundation
import Firebase

struct MessageService {
    
    static let messageCollection = Firestore.firestore().collection("messages")
    
    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }///кто отправляет сообщение
        let chatPartnerId = user.id ///кому отправляем сообщение
        ///ссылка на текущего пользователя
        let currentUserRef = messageCollection.document(currentUid).collection(chatPartnerId).document()///создаем чат
        ///ссылка на собеседника
        let chatPartnerRef = messageCollection.document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Massage(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnerId,
            messageTaxt: messageText,
            timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else  { return }/// кодируем данные перед отправкой
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
    
    static func observMessage(chatPartner: User, completion: @escaping ([Massage]) -> Void){
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        let chatPartnerUid = chatPartner.id
        let query = messageCollection
            .document(currentUserId)
            .collection(chatPartnerUid)
            .order(by: "timestamp",descending: false) ///показывать сообщения от старых к новым
        
        query.addSnapshotListener { snapshot, _ in ///Слушает появление новых сообщений
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap ({ try? $0.document.data(as: Massage.self) })
            
            for (index, message) in messages.enumerated() where !message.isFromCurrentUser {///где сообщения не от меня
                messages[index].user = chatPartner
            }
            
            completion(messages)
        }
        
    }
}
