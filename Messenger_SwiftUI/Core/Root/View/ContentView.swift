//
//  ContentView.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 28.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView() ///Если пользователь вошел
            } else {
                loginView() ///Если пользователь НЕ вошел, то нужно зайти
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
