import SwiftUI

struct SplashScreen: View {
    
    @Binding var isPresented: Bool
    
    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = 45.0
    @State private var spacing = 5.0
    
    var vm = ProverbViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Image("china1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(
                        width: geo.size.width,
                        height: geo.size.height
                    )
                    .opacity(opacity)
                
                VStack {
                    VStack(spacing: spacing) {
                        Text("Line1")
                            .foregroundStyle(.red)
                        Text("Line 2")
                            .foregroundStyle(.yellow)
                        Text("Line 3")
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
        }
    }
}

#Preview {
    SplashScreen(isPresented: .constant(true))
}
