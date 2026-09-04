import SwiftUI

struct HUDBarActions {
    var previous: () -> Void = {}
    var togglePlay: () -> Void = {}
    var next: () -> Void = {}
    var toggleMute: () -> Void = {}
    var toggleFavorite: () -> Void = {}
    var more: () -> Void = {}
}

struct HUDBarView: View {
    @Binding var volume: Double
    let isPlaying: Bool
    var actions: HUDBarActions = HUDBarActions()

    var body: some View {
        GlassEffectContainer {
            HStack(spacing: 2) {
                Button(action: actions.previous) {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(.primary)
                        .frame(width: 36, height: 36)
                }
                .buttonStyle(.plain)

                Button(action: actions.togglePlay) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(.primary)
                        .frame(width: 40, height: 40)
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive(), in: .circle)

                Button(action: actions.next) {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(.primary)
                        .frame(width: 36, height: 36)
                }
                .buttonStyle(.plain)

                Divider()
                    .frame(width: 1, height: 20)

                Button(action: actions.toggleMute) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)

                Slider(value: $volume)
                    .controlSize(.small)
                    .frame(maxWidth: .infinity)

                Divider()
                    .frame(width: 1, height: 20)

                Button(action: actions.toggleFavorite) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(.red)
                        .frame(width: 36, height: 36)
                }
                .buttonStyle(.plain)

                Button(action: actions.more) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 17))
                        .foregroundStyle(.secondary)
                        .frame(width: 36, height: 36)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 8)
            .frame(height: 50)
            .glassEffect(.regular, in: .capsule)
        }
    }
}
