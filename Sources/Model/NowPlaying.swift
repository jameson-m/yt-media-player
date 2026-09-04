import Foundation

struct NowPlaying: Hashable {
    let title: String
    let channel: Channel
    let isLive: Bool
    let viewerCount: Int?

    var subtitle: String {
        guard let viewerCount else { return channel.name }
        return "\(channel.name) · \(Self.formatViewerCount(viewerCount)) watching"
    }

    private static func formatViewerCount(_ count: Int) -> String {
        guard count >= 1000 else { return "\(count)" }
        let thousands = Double(count) / 1000
        let rounded = (thousands * 10).rounded() / 10
        if rounded.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(rounded))K"
        }
        return String(format: "%.1fK", rounded)
    }
}
