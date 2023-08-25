//
//  NewMessageView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 24.08.2023.
//

import SwiftUI

struct NewMessageView: View {

    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
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
                
                ForEach(0...10, id: \.self) {user in
                    VStack {
                        HStack {
                            CircleProfileImageView(user:
                                                    User.MOCK_USER,
                                                   size: .small)
                            
                            Text("Alex SS")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading, 40)
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
            NewMessageView()
        }
    }
}
