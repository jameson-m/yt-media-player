#!/bin/zsh
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/bootstrap.sh
./scripts/xcbuild.sh
open .build/Build/Products/Debug/YTMediaPlayer.app
