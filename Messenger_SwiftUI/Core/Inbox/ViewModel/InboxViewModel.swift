//
//  InboxViewModel.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 29.08.2023.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var currentUser : User?
    @Published var recentMessages = [Massage]()
    
    private var cancellables = Set<AnyCancellable>()
    private var service = InboxService()
    
    init(){
        setupSubscribers()
        service.observeRecentMessages()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)

        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)

    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]){
        var messages = changes.compactMap({ try? $0.document.data(as: Massage.self )})
        
        for i in 0 ..< changes.count {
            let message = messages[i]
            UserService.fetchUser(with: message.chatPartnerId) { user in
                /// message.chatPartnerId берем сообщения из чата собесединика
                messages[i].user = user
                self.recentMessages.append(messages[i])
            }
        }
    }
  
}
