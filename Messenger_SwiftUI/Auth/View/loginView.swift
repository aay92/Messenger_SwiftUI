//
//  loginView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 22.08.2023.
//

import SwiftUI


struct loginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()

                ///logo view
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .padding()
                ///text field
                VStack{
                    TextField("Введите email", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    SecureField("Введите пароль", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                .padding()
                ///forget password
                Button {
                    Task{ try await viewModel.login() }

                } label: {
                    Text("Забыли пароль")
                        .font(.footnote)
                        .fontWidth(.compressed)
                        .padding(.top)
                        .padding(.trailing, 20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
    
                ///login button
                Button {
                    print("")
                } label: {
                    Text("Войти")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 44)
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                ///facebook login
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("Или")
                        .font(.footnote)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(Color(.systemBlue))

                    Text("Продолжить с фейсбук")
                        .font(.footnote)
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Divider()
                ///sign up link
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Нет аккаунта?")
                        Text("Зарегестрироваться")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding()


            }
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
