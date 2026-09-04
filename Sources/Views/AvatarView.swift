import SwiftUI

struct AvatarView: View {
    let channel: Channel
    var size: CGFloat = 24

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: channel.gradientHex.map { Color(hex: $0) },
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Text(channel.initials)
                .font(.system(size: size * 0.38, weight: .bold))
                .foregroundStyle(.white)
        }
        .frame(width: size, height: size)
        .overlay(alignment: .bottomTrailing) {
            if channel.isLive {
                Circle()
                    .fill(.red)
                    .frame(width: 8, height: 8)
                    .overlay(
                        Circle().strokeBorder(Color(nsColor: .windowBackgroundColor), lineWidth: 1.5)
                    )
            }
        }
    }
}
