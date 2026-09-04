import SwiftUI

@main
struct YTMediaPlayerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Window("YT Media Player", id: "main") {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: 480, height: 270)
        .windowResizability(.contentMinSize)
    }
}
