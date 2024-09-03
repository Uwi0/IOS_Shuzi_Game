//
//  Shuzi_GameApp.swift
//  Shuzi Game
//
//  Created by dwi prasetyo on 02/09/24.
//

import SwiftUI

@main
struct Shuzi_GameApp: App {
    @State private var gVM: GameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(gVM)
        }
    }
}
