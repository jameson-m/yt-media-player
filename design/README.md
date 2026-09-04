# Design mockups

## Selected direction

**Immersive** (round 1, mockup 02) was chosen as the main UI direction. Full detail lives in `immersive/`:

| File | What |
|------|------|
| `immersive/storyboard.html` | Full storyboard |
| `immersive/system.html` | System & settings |
| `immersive/prototype.html` | Interactive prototype |
| `immersive/immersive.css` | Direction-specific styles |

Menu Bar (round 1, mockup 05) is kept as a secondary *feature* (a popover/keep-on-top mode), not the main UI.

Static HTML mockups (no build step). Open `index.html` in Safari/Chrome:

```sh
open design/index.html
```

## Explorations (round 1)

| # | File | Direction | Status |
|---|------|-----------|--------|
| 01 | `01-rail.html` | Sketch-faithful: left glass rail (volume + transport), video hero | Passed |
| 02 | `02-immersive.html` | Edge-to-edge video, floating glass controls that fade when idle | Chosen |
| 03 | `03-channel-dock.html` | Favorites dock w/ live dots + classic transport bar + URL field | Passed |
| 04 | `04-now-playing.html` | Audio-first portrait card, video as optional "album art" | Passed |
| 05 | `05-menu-bar.html` | Menu bar popover + optional floating keep-on-top pill | Kept as feature |

Shared: `glass.css` (tokens, glass surfaces, window chrome, controls) and `glass.js` (SF-Symbol-ish icon sprite, light/dark toggle). Toggle theme with the ◐ button; it follows system appearance by default.
