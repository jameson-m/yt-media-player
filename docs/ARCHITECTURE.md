# Architecture

## Module map
- `Sources/App` — window + app lifecycle + screenshot support (`AppDelegate`, `WindowConfigurator`, `ScreenshotSupport`, `YTMediaPlayerApp`, `ContentView`)
- `Sources/Model` — value types (`Channel`, `NowPlaying`, `SampleData`) + `HUDVisibilityModel`
- `Sources/Views` — scene, HUD bar, chip, meta (`PlaceholderSceneView`, `HUDBarView`, `ChannelChipView`, `NowPlayingMetaView`, `AvatarView`, `LiveBadgeView`)
- `Tests` — unit tests
- `scripts` — bootstrap/build/test/run/screenshot

## HUD visibility state machine
1. Pointer moves → visible, (re)start idle timer.
2. Idle timer fires (2.0s no move) → hidden.
3. Pointer exits window → start leave timer (0.6s).
4. Leave timer fires → hidden.
5. Pinned → cancel timers, force visible, ignore hide requests.
6. Unpinned → resume idle timer from visible.

## Screenshot evidence
`scripts/screenshot.sh` prefers a window-server capture: it launches the app with
`YTMP_PRINT_WINDOW_ID=1`, reads the printed `WINDOW_ID=<n>` once the window is on
screen, then runs `screencapture -x -l<n>`. This needs Screen Recording permission
granted to the launching terminal, and is the only path that shows the traffic
lights and real Liquid Glass compositing. If `screencapture` fails or produces no
file (e.g. permission not granted), the script falls back to the in-process
`YTMP_SCREENSHOT` capture (`ScreenshotSupport.capture`, a `cacheDisplay` of the
content view) — traffic lights are absent and glass renders flat in that mode.
`CGWindowListCreateImage` is unavailable on the macOS 26 SDK (DEC-021), which is
why the fallback uses `cacheDisplay` instead.

## Where next builds plug in
- `PlayerView` (WKWebView + YouTube IFrame) replaces `PlaceholderSceneView`.
- `FavoritesStore` feeds the channel chip popover.
- `LiveStatusProvider` protocol, stub implementation first — no indicator in v1.
- Settings window / menu bar extra come later.
