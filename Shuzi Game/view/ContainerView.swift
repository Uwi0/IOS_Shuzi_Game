import SwiftUI

struct ContainerView: View {
    
    @State private var isSplashScreenPresented = true
    
    var body: some View {
        if isSplashScreenPresented {
            SplashScreen(isPresented: $isSplashScreenPresented)
                .disabled(!isSplashScreenPresented)
        } else {
            MainView()
        }
    }
}

#Preview {
    ContainerView()
        .environment(GameViewModel())
}
