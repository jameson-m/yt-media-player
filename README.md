# YT Media Player

Tiny native macOS mini player for YouTube background music/livestreams. "Immersive" design: the window *is* the video, Liquid Glass controls float over it and fade when idle.

## Status
Scaffold only. Window, placeholder scene, HUD (bar/chip/meta), and idle-fade all work. No YouTube playback yet.

## Requirements
- macOS 26
- Xcode 26
- `brew install xcodegen`

## Run
```
scripts/bootstrap.sh      # generate YTMediaPlayer.xcodeproj
scripts/run.sh             # build + open
scripts/xctest.sh          # unit tests
scripts/screenshot.sh out.png   # build, launch, self-screenshot, quit
```

## Design
- `design/index.html` — overview
- `design/immersive/storyboard.html` — target frames (source of truth)

## Project layout
- `Sources/App` — app entry, window config, screenshot support
- `Sources/Model` — value types + `HUDVisibilityModel`
- `Sources/Views` — scene, HUD bar, chip, meta
- `Tests` — unit tests
- `scripts` — bootstrap/build/test/run/screenshot
