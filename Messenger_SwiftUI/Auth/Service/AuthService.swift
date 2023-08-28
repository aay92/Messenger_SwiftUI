//
//  AuthService.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 27.08.2023.
//

import Foundation
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User? ///Dошел ли пользователь
    ///
    static let shared = AuthService() ///один экземпляр службы аунтификации - синглтон
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("\(userSession?.uid)")
    }
    
    func login(with email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to signOut user with \(error.localizedDescription)")

        }
    }
    
    func createUser(with email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user

        } catch {
            print("DEBUG: Failed to create user with \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil ///эта переменная нужна для отображения зарег/залог userA
        } catch {
            print("DEBUG: signOut not successfull")
        }
    }
}
