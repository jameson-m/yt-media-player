import Foundation

enum SampleData {
    static let channels: [Channel] = [
        Channel(
            id: "lofi-girl",
            name: "Lofi Girl",
            initials: "LG",
            gradientHex: [0x7B61FF, 0xFF6FAE],
            isLive: true,
            viewerCount: 31200,
            lastLiveDescription: nil
        ),
        Channel(
            id: "chillhop-radio",
            name: "Chillhop Radio",
            initials: "CR",
            gradientHex: [0x00C6A7, 0x0A84FF],
            isLive: true,
            viewerCount: 8400,
            lastLiveDescription: nil
        ),
        Channel(
            id: "synthwave-boy",
            name: "Synthwave Boy",
            initials: "SB",
            gradientHex: [0xFF9F43, 0xFF4D6D],
            isLive: true,
            viewerCount: 2100,
            lastLiveDescription: nil
        ),
        Channel(
            id: "ambient-worlds",
            name: "Ambient Worlds",
            initials: "AW",
            gradientHex: [0xF6D365, 0xFDA085],
            isLive: false,
            viewerCount: nil,
            lastLiveDescription: "2d ago"
        ),
        Channel(
            id: "cafe-music-bgm",
            name: "Cafe Music BGM",
            initials: "CB",
            gradientHex: [0x43E97B, 0x38F9D7],
            isLive: false,
            viewerCount: nil,
            lastLiveDescription: "5h ago"
        ),
    ]

    static let nowPlaying = NowPlaying(
        title: "lofi hip hop radio 📚 beats to relax/study to",
        channel: channels[0],
        isLive: true,
        viewerCount: 31200
    )
}
