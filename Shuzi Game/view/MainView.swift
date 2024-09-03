import SwiftUI

struct MainView: View {
    
    @Environment(GameViewModel.self) var gVm
    @State private var showSettingsView: Bool = true
    @State private var showPinyin: Bool = true
    
    private var toggleTitle: String {
        showPinyin ? "Hide Pinyin" : "Show Pinyin"
    }
    
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)
            VStack {
                ScoreView(
                    score: gVm.gameModel.score,
                    maxTurns: gVm.gameModel.maxTurns
                )
                Toggle(toggleTitle, isOn: $showPinyin.animation())
                    .padding(.vertical)
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
