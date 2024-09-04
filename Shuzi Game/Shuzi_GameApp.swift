import SwiftUI

@main
struct Shuzi_GameApp: App {
    @State private var gVM: GameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environment(gVM)
        }
    }
}
