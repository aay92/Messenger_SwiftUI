//
//  ChatViewModel.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 01.09.2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messageText = ""
    @Published var messages = [Massage]()
    let user: User
    
    
    init(user: User){
        self.user = user
        observMessages()
    }
    
    func observMessages(){
        MessageService.observMessage(chatPartner: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage(){
        MessageService.sendMessage(messageText, toUser: user)
    }
}
