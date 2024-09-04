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
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
