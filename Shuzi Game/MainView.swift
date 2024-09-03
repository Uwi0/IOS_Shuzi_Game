import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVm
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Joy", action: { gVm.randomSuccessSound()})
            Button("Incorrect Answer", action: { gVm.randomInCorrectSound()})
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
