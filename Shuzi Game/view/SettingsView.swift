import SwiftUI

typealias SettingContent = VStack<TupleView<(Form<Section<Text, TupleView<(Text, Slider<EmptyView, EmptyView>)>, EmptyView>>, Button<Text>)>>

struct SettingsView: View {
    @Environment(GameViewModel.self) var gVM
    
    @Binding var showSettingView: Bool
    @State var volume: Float
    
    var body: some View {
        NavigationStack {
            SettingContent()
            .navigationTitle("Game Settings")
        }
    }
    
    private func SettingContent() -> SettingContent {
        return VStack {
            VolumeSlider()
            Button("Ok", action: {
                gVM.gameModel.volume = volume
                showSettingView.toggle()
            })
        }
    }
    
    private func VolumeSlider() -> Form<Section<Text, TupleView<(Text, Slider<EmptyView, EmptyView>)>, EmptyView>> {
        return Form {
            Section(
                content: {
                    Text("Volume")
                    Slider(value: $volume, in: 0...1, step: 0.1)
                },
                header: {
                    Text("Audio Settings")
                    
                }
            )
        }
    }
    
}

#Preview {
    SettingsView(showSettingView: .constant(true), volume: 0.7)
        .environment(GameViewModel())
}
