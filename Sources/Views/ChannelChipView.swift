import SwiftUI

struct ChannelChipView: View {
    let channel: Channel

    var body: some View {
        HStack(spacing: 7) {
            AvatarView(channel: channel, size: 24)

            Text(channel.name)
                .font(.system(size: 12, weight: .semibold))

            Image(systemName: "chevron.down")
                .font(.system(size: 11))
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
        .padding(.leading, 4)
        .padding(.trailing, 5)
        .glassEffect(.regular, in: .capsule)
    }
}
