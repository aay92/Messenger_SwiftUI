//
//  ChatView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 25.08.2023.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                //header
                CircleProfileImageView(user: user,
                                       size: .xLarge)
                VStack(spacing: 4){
                    Text(user.fullName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Messangers")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                //message

                ForEach(viewModel.messages) { message in
                    ChatMassageCell(messages: message)

                }
                //message input view
            }
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Сообщение...", text: $viewModel.messageText, axis: .vertical)
                    .padding()
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Отправить")
                        .fontWeight(.semibold)
                }.padding(.horizontal)
                
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.MOCK_USER)
    }
}
