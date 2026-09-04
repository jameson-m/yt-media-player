import SwiftUI
import AppKit

/// Configures the host NSWindow to match the Immersive shell (hidden title bar, locked aspect, etc).
struct WindowConfigurator: NSViewRepresentable {
    var hudVisible: Bool = true
    var onWindow: ((NSWindow) -> Void)? = nil

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            guard let window = view.window else { return }
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.styleMask.insert(.fullSizeContentView)
            window.isMovableByWindowBackground = true
            window.minSize = NSSize(width: 240, height: 135)
            window.contentAspectRatio = NSSize(width: 16, height: 9)
            window.setFrameAutosaveName("MainWindow")
            window.isOpaque = false
            window.backgroundColor = .clear
            window.standardWindowButton(.closeButton)?.isHidden = false
            window.standardWindowButton(.miniaturizeButton)?.isHidden = false
            window.standardWindowButton(.zoomButton)?.isHidden = false
            onWindow?(window)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let window = nsView.window else { return }
        let targetAlpha: CGFloat = hudVisible ? 1 : 0
        let duration = hudVisible ? 0.15 : 0.35
        NSAnimationContext.runAnimationGroup { animationContext in
            animationContext.duration = duration
            [window.standardWindowButton(.closeButton),
             window.standardWindowButton(.miniaturizeButton),
             window.standardWindowButton(.zoomButton)]
                .forEach { $0?.animator().alphaValue = targetAlpha }
        }
    }
}
