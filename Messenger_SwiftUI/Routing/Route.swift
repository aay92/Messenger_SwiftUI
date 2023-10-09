//
//  Route.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 05.09.2023.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
