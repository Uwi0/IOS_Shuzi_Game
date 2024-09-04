import SwiftUI

struct SplashScreenTextView: View {
    
    let spacing: Double
    let text1: String
    let text2: String
    let text3: String
    let scale: CGSize
    let angle: Double
    let opacity: Double
    
    var body: some View {
        VStack(spacing: spacing) {
            Text(text1)
                .foregroundStyle(.red)
            Text(text2)
                .foregroundStyle(.yellow)
            Text(text3)
                .foregroundStyle(.red)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(
                        colors: [.black, .gray],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .opacity(opacity)
        )
        .font(.title)
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
        .scaleEffect(scale)
        .rotation3DEffect(
            Angle(degrees: angle),
            axis: (x: 1.0, y: 0.0, z: 0.0)
        )
    }
}

#Preview {
    VStack {
        SplashScreenTextView(
            spacing: 5,
            text1: "Line 1",
            text2: "Line 2",
            text3: "Line 3",
            scale: CGSize(width: 0.5, height: 0.5),
            angle: 45,
            opacity: 1
        )
        
    }
}
