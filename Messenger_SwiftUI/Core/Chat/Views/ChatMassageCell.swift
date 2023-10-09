//
//  ChatMassageCell.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 27.08.2023.
//

import SwiftUI

struct ChatMassageCell: View {
    
    let messages : Massage
    
    private var isFromCurrentUser: Bool {
        return messages.isFromCurrentUser
    }
    
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                Text(messages.messageTaxt)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(Color.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth:
                            UIScreen.main.bounds.width / 1.5,
                            alignment: .trailing)
            } else {
                HStack(alignment: .bottom, spacing: 8){
                    CircleProfileImageView(user: User.MOCK_USER,
                                           size: .xxSmall)
                    Text(messages.messageTaxt)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(Color.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth:
                                UIScreen.main.bounds.width / 1.75,
                                alignment: .leading)

                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

//struct ChatMassageCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatMassageCell(isFromCurrentUser: false)
//    }
//}
