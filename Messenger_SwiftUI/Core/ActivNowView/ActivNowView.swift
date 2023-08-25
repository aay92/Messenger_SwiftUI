//
//  ActivNowView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 23.08.2023.
//

import SwiftUI

struct ActivNowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0...10, id: \.self){ user in
                    VStack{
                        ZStack(alignment: .bottomTrailing){
                            CircleProfileImageView(user: User.MOCK_USER,
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
                        Text("Bruce")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
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
