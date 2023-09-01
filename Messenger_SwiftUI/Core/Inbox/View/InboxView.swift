//
//  InboxView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 23.08.2023.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?///Выбранный пользователь
    @State private var showChat = false
    
    private var user: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                ActivNowView()
                List{
                    ForEach(0...10 , id: \.self){message in
                        InboxRowView()
                    }
                }.listStyle(PlainListStyle())
                    .frame(height: UIScreen.main.bounds.height - 120)
            }
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: User.self, destination: { user in
                ViewProfile(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .sheet(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
//            .fullScreenCover(isPresented: $showNewMessageView, content: {
//                NewMessageView()
//            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        NavigationLink(value: user) {
                            CircleProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Чаты")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()                    } label: {
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.black, Color(.systemGray5))
                        }
                    
                }
            }
            
        }


    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
