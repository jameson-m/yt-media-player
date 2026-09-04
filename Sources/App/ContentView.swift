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
        .overlay(alignment: .topTrailing) {
            ChannelChipView(channel: SampleData.nowPlaying.channel)
                .padding(10)
        }
        .overlay(alignment: .bottomLeading) {
            NowPlayingMetaView(nowPlaying: SampleData.nowPlaying)
                .padding(.leading, 16)
                .padding(.bottom, 74)
                .padding(.trailing, 16)
        }
    }
}
