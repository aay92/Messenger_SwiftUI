//
//  ActiveViewModel.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 05.09.2023.
//

import Foundation
import Firebase

class ActiveViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task { try await fetchUsers() }
    }
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        self.users = try await UserService.fetchAllUser(limit: 10)
        let allUsers = try await UserService.fetchAllUser(limit: 10)
        self.users = allUsers.filter({ $0.id != currentUser })///Убираем фильтром текущего пользователя(Который вошел в систему)
    }
}
