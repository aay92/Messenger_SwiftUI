//
//  InboxRowView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 24.08.2023.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircleProfileImageView(user: User.MOCK_USER,
                                   size: .medium)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Петя Васильев")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Тестовое сообщение")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack{
                Text("Вчера")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
