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
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)

    }
    ////
    ///onoinpanvapvwvvv
    ///
    ///voinanva
    ///fmaonaoinao
    ///
    ///oifaoifnafna
}
