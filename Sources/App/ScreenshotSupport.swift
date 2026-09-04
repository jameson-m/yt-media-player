import AppKit

/// Self-screenshot mode for evidence capture: set YTMP_SCREENSHOT to a file path to
/// have the app snapshot its own window and quit shortly after launch.
enum ScreenshotSupport {
    @MainActor static func armIfRequested() {
        guard let outPath = ProcessInfo.processInfo.environment["YTMP_SCREENSHOT"] else { return }
        let delay = ProcessInfo.processInfo.environment["YTMP_SCREENSHOT_DELAY"].flatMap(Double.init) ?? 1.5

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            capture(to: outPath)
        }
    }

    @MainActor private static func capture(to outPath: String) {
        guard let window = NSApp.windows.first(where: { $0.isVisible }) else {
            FileHandle.standardError.write(Data("ScreenshotSupport: no visible window\n".utf8))
            exit(2)
        }

        guard let cgImage = windowImage(for: window) else {
            FileHandle.standardError.write(Data("ScreenshotSupport: failed to capture window\n".utf8))
            exit(2)
        }

        let rep = NSBitmapImageRep(cgImage: cgImage)
        guard let png = rep.representation(using: .png, properties: [:]) else {
            FileHandle.standardError.write(Data("ScreenshotSupport: failed to encode PNG\n".utf8))
            exit(2)
        }

        do {
            try png.write(to: URL(fileURLWithPath: outPath))
        } catch {
            FileHandle.standardError.write(Data("ScreenshotSupport: failed to write \(outPath): \(error)\n".utf8))
            exit(2)
        }

        NSApp.terminate(nil)
    }

    /// CGWindowListCreateImage is obsoleted (compile error) on the macOS 26 SDK; capture via the view's bitmap cache instead.
    @MainActor private static func windowImage(for window: NSWindow) -> CGImage? {
        guard let contentView = window.contentView,
              let bitmap = contentView.bitmapImageRepForCachingDisplay(in: contentView.bounds) else {
            return nil
        }
        contentView.cacheDisplay(in: contentView.bounds, to: bitmap)
        return bitmap.cgImage
    }
}
