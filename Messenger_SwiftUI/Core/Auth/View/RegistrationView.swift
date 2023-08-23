//
//  RegistrationView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 23.08.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    
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
                TextField("Введите email", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                TextField("Введите полние имя", text: $fullName)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                SecureField("Введите пароль", text: $password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                Button {
                    print("")
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
