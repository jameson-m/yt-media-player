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

## Where next builds plug in
- `PlayerView` (WKWebView + YouTube IFrame) replaces `PlaceholderSceneView`.
- `FavoritesStore` feeds the channel chip popover.
- `LiveStatusProvider` protocol, stub implementation first — no indicator in v1.
- Settings window / menu bar extra come later.
