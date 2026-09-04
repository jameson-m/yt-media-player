import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            PlaceholderSceneView()
        }
        .frame(minWidth: 240, minHeight: 135)
        .background(WindowConfigurator())
    }
}
