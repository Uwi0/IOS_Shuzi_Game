import SwiftUI

struct MainView: View {
    
    @Environment(GameViewModel.self) var gVm
    @State var showSettingsView: Bool = true
    
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)
            VStack {
                Spacer()
                Text(showSettingsView ? "Appearing": "Gone")
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
