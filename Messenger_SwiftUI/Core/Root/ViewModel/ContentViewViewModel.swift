//
//  ContentViewViewModel.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 28.08.2023.
//

import Firebase
import Combine

class ContentViewViewModel: ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        setupSubscribe()
    }
    private func setupSubscribe(){
        AuthService.shared.$userSession.sink {[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellable)

    }
}
