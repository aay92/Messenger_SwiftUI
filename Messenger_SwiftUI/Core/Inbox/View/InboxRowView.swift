//
//  InboxRowView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 24.08.2023.
//

import SwiftUI

struct InboxRowView: View {
    
    let message : Massage
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircleProfileImageView(user: message.user,
                                   size: .medium)
            
            VStack(alignment: .leading, spacing: 4){
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(message.messageTaxt)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack{
                Text(message.timestampString)
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

//struct InboxRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        InboxRowView()
//    }
//}
