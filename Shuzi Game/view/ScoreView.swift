import SwiftUI

struct ScoreView: View {
    let score: Int
    let maxTurns: Int
    var body: some View {
        Text("Score: \(score) out of \(maxTurns)")
            .bold()
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    ScoreView(score: 2, maxTurns: 5)
}
