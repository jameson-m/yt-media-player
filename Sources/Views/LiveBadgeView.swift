import SwiftUI

struct LiveBadgeView: View {
    @State private var dimmed = false

    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(.white)
                .frame(width: 6, height: 6)
                .opacity(dimmed ? 0.45 : 1)
                .animation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true), value: dimmed)

            Text("LIVE")
                .font(.system(size: 10, weight: .bold))
                .tracking(0.5)
                .foregroundStyle(.white)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 7)
        .background(RoundedRectangle(cornerRadius: 6).fill(.red))
        .onAppear { dimmed = true }
    }
}
