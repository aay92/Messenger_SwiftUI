//
//  NewMessageView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 24.08.2023.
//

import SwiftUI

struct NewMessageView: View {

    @State private var searchText = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var selectedUser: User?///Выбранный пользователь

    
    var body: some View {
        VStack {
            ScrollView {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("КОНТАКТЫ")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading )
                    .padding()
                
                ForEach(viewModel.users) {user in
                    VStack {
                        HStack {
                            CircleProfileImageView(user: user,
                                                   size: .small)
                            
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("Новое сообщение")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Закрыть"){
                        dismiss()
                    }
                    .foregroundColor(.black)
                    

                }
        }
        }
        
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            NewMessageView(selectedUser: .constant(User.MOCK_USER))
        }
    }
}
