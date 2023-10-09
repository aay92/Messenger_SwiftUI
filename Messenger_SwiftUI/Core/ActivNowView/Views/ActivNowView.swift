//
//  ActivNowView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 23.08.2023.
//

import SwiftUI

struct ActivNowView: View {
    
    @StateObject var viewModel = ActiveViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(viewModel.users, id: \.self){ user in
                    NavigationLink(value: Route.chatView(user)) {
                        VStack{
                            ZStack(alignment: .bottomTrailing){
                                CircleProfileImageView(user: user,
                                                       size: .medium)
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                        }
                    }
                }.padding()

            }
           
        }
        .frame(height: 106)

    }
}

struct ActivNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActivNowView()
    }
}
