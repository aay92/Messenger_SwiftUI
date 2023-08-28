//
//  ViewProfile.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 25.08.2023.
//

import SwiftUI
import PhotosUI

struct ViewProfile: View {
    
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        
        ///header
        VStack{
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem){
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircleProfileImageView(user: user, size: .xLarge)
                    }
                }
               
                Text("Bruce Wayne")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
        ///List
        List {
            Section{
                ForEach(SettingOptionsViewModel.allCases) {option in
                    HStack{
                        Image(systemName: option.imageName)
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundColor(option.imageNameColor)
                        Text(option.title)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            Section {
                Button("Выйти"){
                    AuthService.shared.signOut()
                }
                Button("Удалить учетную запись"){}
            }
            .foregroundColor(.red)
            .fontWeight(.semibold)

        }
    }
}
}

struct ViewProfile_Previews: PreviewProvider {
    static var previews: some View {
        ViewProfile(user: User.MOCK_USER)
    }
}
