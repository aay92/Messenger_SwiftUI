//
//  AuthService.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 27.08.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User? ///Dошел ли пользователь
    ///
    static let shared = AuthService() ///один экземпляр службы аунтификации - синглтон
    
    init(){
        self.userSession = Auth.auth().currentUser
        leadCurrentUserData()///Загружаем данные о пользователе
        print("DEBUG: \(String(describing: userSession?.uid))")
    }
    
    @MainActor ///Отправка в главный поток после процедуры
    func login(with email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            result.user.uid
            leadCurrentUserData()///Загружаем данные о пользователе
        } catch {
            print("DEBUG: Failed to signOut user with \(error.localizedDescription)")

        }
    }
    
    @MainActor ///Отправка в главный поток после процедуры
    func createUser(with email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullName: fullname, id: result.user.uid)
            leadCurrentUserData()///Загружаем данные о пользователе
        } catch {
            print("DEBUG: Failed to create user with \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil ///эта переменная нужна для отображения зарег/залог user
            UserService.shared.currentUser = nil///Обнуляем текущего пользователя
        } catch {
            print("DEBUG: signOut not successfull")
        }
    }
    
    private func uploadUserData(email: String, fullName: String, id: String) async throws {
        let user = User(fullName: fullName, email: email)
        guard let encoderUser = try? Firestore.Encoder().encode(user) else { return } /// Кодируем пользователя
        try await Firestore.firestore().collection("users").document(id).setData(encoderUser)/// загружаем пользователя в firebase
    }
    
    private func leadCurrentUserData(){
        Task { try await UserService.shared.fetchCurrentUser() }
    }
    
  
}
