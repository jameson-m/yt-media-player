import Foundation

struct Channel: Identifiable, Hashable {
    let id: String
    let name: String
    let initials: String
    let gradientHex: [UInt32]
    let isLive: Bool
    let viewerCount: Int?
    let lastLiveDescription: String?
}
