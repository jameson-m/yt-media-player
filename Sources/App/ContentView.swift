import SwiftUI

struct ContentView: View {
    @State private var volume = 0.48

    var body: some View {
        ZStack {
            PlaceholderSceneView()
        }
        .frame(minWidth: 240, minHeight: 135)
        .background(WindowConfigurator())
        .overlay(alignment: .bottom) {
            HUDBarView(volume: $volume, isPlaying: true)
                .padding(12)
        }
    }
}
