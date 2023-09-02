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
    
    let service: ChatService
    
    init(user: User){
        self.service = ChatService(chatPartner: user)
        observMessages()
    }
    
    func observMessages(){
        service.observMessage(){ messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage(){
        service.sendMessage(messageText)
    }
}
