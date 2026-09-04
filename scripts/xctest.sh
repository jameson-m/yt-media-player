#!/bin/zsh
set -euo pipefail
cd "$(dirname "$0")/.."
xcodebuild -project YTMediaPlayer.xcodeproj -scheme YTMediaPlayer -configuration Debug -derivedDataPath .build -destination 'platform=macOS' test -quiet
