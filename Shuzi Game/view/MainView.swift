import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVm
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("TODO")
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
