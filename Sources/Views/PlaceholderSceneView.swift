import SwiftUI

struct PlaceholderSceneView: View {
    private static let stops: [Gradient.Stop] = [
        Gradient.Stop(color: Color(hex: 0x171A45), location: 0.0),
        Gradient.Stop(color: Color(hex: 0x4A3679), location: 0.38),
        Gradient.Stop(color: Color(hex: 0xB95B7D), location: 0.60),
        Gradient.Stop(color: Color(hex: 0xF4A06C), location: 0.72),
        Gradient.Stop(color: Color(hex: 0xF7C58A), location: 0.74),
        Gradient.Stop(color: Color(hex: 0x1B1830), location: 0.742),
        Gradient.Stop(color: Color(hex: 0x100E20), location: 1.0),
    ]

    private let gradient = LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)

    var body: some View {
        GeometryReader { geometry in
            let diameter = geometry.size.width * 0.11
            let center = CGPoint(x: geometry.size.width * 0.70, y: geometry.size.height * 0.30)

            ZStack {
                gradient

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(hex: 0xFFF0C8).opacity(0.35), Color(hex: 0xFFF0C8).opacity(0.0)],
                            center: .center,
                            startRadius: 0,
                            endRadius: diameter * 0.9
                        )
                    )
                    .frame(width: diameter * 1.8, height: diameter * 1.8)
                    .position(center)

                Circle()
                    .fill(Color(hex: 0xFFF0C8))
                    .frame(width: diameter, height: diameter)
                    .blur(radius: 1)
                    .position(center)
            }
        }
        .ignoresSafeArea()
    }
}
