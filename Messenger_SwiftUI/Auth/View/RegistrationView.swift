//
//  RegistrationView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 23.08.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
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
                
                TextField("Введите полние имя", text: $viewModel.fullName)
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
                
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Зарегестрироваться")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 44)
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
            }
            .padding()
            Spacer()
            
            Divider()
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Есть учетная запись?")
                    Text("Войти")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding()
        }

        }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
