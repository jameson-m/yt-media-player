# yt-media-player — project conventions

Native macOS-only SwiftUI mini player for YouTube background music/livestreams. Design source of truth: `design/immersive/` (storyboard, system, prototype).

## Locked decisions (don't re-ask)
- **Direction:** "Immersive" — video fills window, Liquid Glass controls float over it, fade when idle. Channel switcher = small overlaid chip, never a persistent panel.
- **Playback:** WKWebView + YouTube IFrame player, video streamed in (not audio-only-first).
- **Live status:** YouTube Data API v3 (user supplies key later). v1 = stub provider, no indicator shown.
- **Menu bar extra:** future update, not v1.
- **Min target:** macOS 26.0. Build with Xcode 26.x. Use `.glassEffect()` (no Material fallback needed).
- **Project gen:** XcodeGen (`project.yml`). `*.xcodeproj` is gitignored; run `scripts/bootstrap.sh` to generate. Never hand-edit pbxproj.
- **Identity:** bundle id `com.jamesonmcbride.YTMediaPlayer`, display name "YT Media Player".
- **Git:** PRs target `main` directly (no integration branch). Commits SSH-signed (already configured; a commit that won't verify won't merge). Commit messages: GitHub 50/72 style — imperative subject ≤ 50 chars, capitalized, no period; blank line; optional body wrapped at 72. No task-id or orchestration prefixes.
- **Issues/PRs:** define GitHub issue first; 1 issue = 1 PR (exceptions allowed). Issue + PR descriptions/comments concise, plain language. Don't open the PR until the branch is ready.
- **CI:** deferred. No GitHub Actions for now.

## Orchestration
Builds are orchestrated from `~/Developer/agent-orchestration` (separate repo): `runs/<date>-yt-media-player*/` (spec, task queue, logs — symlinked from `~/orchestration-other/<date>-yt-media-player*/`), `runner/` (the bun CLI that runs the queue), `docs/process.md` (the build methodology). Worker sessions: read the run package's `SPEC.md` + your task record; append-only JSONL logs; never edit existing lines. Don't start a build run without the user's go-ahead.
