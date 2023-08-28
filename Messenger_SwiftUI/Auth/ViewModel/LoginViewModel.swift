//
//  LoginViewModel.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 27.08.2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""

    
    func login() async throws {
        try await AuthService.shared.createUser(with: email, password: password, fullname: fullName)
    }
}

