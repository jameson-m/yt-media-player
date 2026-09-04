#!/bin/zsh
set -euo pipefail
cd "$(dirname "$0")/.."

if [[ $# -lt 1 ]]; then
    echo "usage: screenshot.sh <out.png>" >&2
    exit 1
fi
out="$1"

./scripts/bootstrap.sh
./scripts/xcbuild.sh

mkdir -p "$(dirname "$out")"

YTMP_SCREENSHOT="$out" .build/Build/Products/Debug/YTMediaPlayer.app/Contents/MacOS/YTMediaPlayer

test -s "$out"
echo "$out"
