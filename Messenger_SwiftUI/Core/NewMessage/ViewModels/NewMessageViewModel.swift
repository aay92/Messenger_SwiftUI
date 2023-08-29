//
//  NewMessageViewModel.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 29.08.2023.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        let allUsers = try await UserService.fetchAllUser()
        self.users = allUsers.filter({ $0.id != currentUser })///Убираем фильтром текущего пользователя(Который вошел в систему)
    }
}
