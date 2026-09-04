import SwiftUI

struct NowPlayingMetaView: View {
    let nowPlaying: NowPlaying

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            if nowPlaying.isLive {
                LiveBadgeView()
            }

            Text(nowPlaying.title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white)
                .lineLimit(1)

            Text(nowPlaying.subtitle)
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.75))
        }
        .shadow(color: .black.opacity(0.6), radius: 8, y: 1)
    }
}
