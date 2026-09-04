import SwiftUI

struct ContentView: View {
    @State private var volume = 0.48
    @State private var hud = HUDVisibilityModel()

    var body: some View {
        ZStack {
            PlaceholderSceneView()

            Group {
                HUDBarView(volume: $volume, isPlaying: true)
                    .padding(12)
                    .frame(maxHeight: .infinity, alignment: .bottom)

                ChannelChipView(channel: SampleData.nowPlaying.channel)
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

                NowPlayingMetaView(nowPlaying: SampleData.nowPlaying)
                    .padding(.leading, 16)
                    .padding(.bottom, 74)
                    .padding(.trailing, 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            .opacity(hud.isVisible ? 1 : 0)
            .animation(.easeOut(duration: hud.isVisible ? 0.15 : 0.35), value: hud.isVisible)
            .allowsHitTesting(hud.isVisible)
        }
        .frame(minWidth: 240, minHeight: 135)
        .background(WindowConfigurator(hudVisible: hud.isVisible))
        .onContinuousHover(coordinateSpace: .local) { phase in
            switch phase {
            case .active:
                hud.pointerMoved()
            case .ended:
                hud.pointerExited()
            }
        }
    }
}
