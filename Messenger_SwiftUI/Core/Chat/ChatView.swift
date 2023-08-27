//
//  ChatView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 25.08.2023.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        
        VStack {
            ScrollView {
                //header
                CircleProfileImageView(user:
                                        User.MOCK_USER,
                                       size: .xLarge)
                VStack(spacing: 4){
                    Text("Bruce Wayne")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Messangers")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                //message

                ForEach(0...15, id: \.self) {message in
                    ChatMassageCell(isFromCurrentUser: Bool.random())

                }
                //message input view
            }
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Сообщение...", text: $messageText, axis: .vertical)
                    .padding()
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                Button {
                    print("tap")
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
        ChatView()
    }
}
