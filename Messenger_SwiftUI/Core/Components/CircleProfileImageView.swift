//
//  CircleProfileImageView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 25.08.2023.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 26
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircleProfileImageView: View {
    
    var user: User
    let size: ProfileImageSize
    
    var body: some View {

        if let imageURL = user.profileImageUrl {
            Image(imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension,height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "persom.circle.fill")
                .resizable()
                .frame(width: size.dimension,height: size.dimension)
                .foregroundColor(Color(.systemGray))
        }
    }
}

struct CircleProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProfileImageView(user: User.MOCK_USER, size: .medium)
    }
}
