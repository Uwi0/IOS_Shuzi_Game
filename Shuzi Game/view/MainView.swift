import SwiftUI

struct MainView: View {
    
    @Environment(GameViewModel.self) var gVm
    @State private var showSettingsView: Bool = false
    @State private var showPinyin: Bool = true
    @State private var done: Bool = false
    
    private var toggleTitle: String {
        showPinyin ? "Hide Pinyin" : "Show Pinyin"
    }
    
    var gameOver: Bool {
        gVm.gameModel.gameWon
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
                if let chineseNum = gVm.gameModel.answer.num99ToChinese() {
                    Spacer()
                    Text(chineseNum.chinese)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text(chineseNum.pinyin)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .opacity(showPinyin ? 1 : 0)
                }
                
                NumberOptionsView(
                    numbers: gVm.gameModel.alternatives,
                    answer: gVm.gameModel.answer
                ).onChange(of: gVm.gameModel.turns) { _, _ in
                    gVm.gameModel.generateNewProblem()
                }
            }
            .padding()
        }
        .fullScreenCover(
            isPresented: $done,
            content: {
                GameOverView(color: .green.opacity(0.8))
            }
        )
        .fullScreenCover(isPresented: $showSettingsView, content: {
            SettingsView(showSettingView: $showSettingsView, volume: gVm.gameModel.volume)
        })
        .onChange(of: gameOver){ _, _ in
            done = gameOver
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
