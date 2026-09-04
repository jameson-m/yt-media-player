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

bin=".build/Build/Products/Debug/YTMediaPlayer.app/Contents/MacOS/YTMediaPlayer"
stdout_file="$(mktemp -t ytmp-screenshot)"

# Primary path: window-server capture via screencapture -l<windowid>. Shows
# traffic lights and real Liquid Glass compositing, unlike the in-process fallback.
YTMP_PRINT_WINDOW_ID=1 "$bin" > "$stdout_file" 2>&1 &
pid=$!

window_id=""
for _ in $(seq 1 100); do
    if grep -q '^WINDOW_ID=' "$stdout_file" 2>/dev/null; then
        window_id="$(grep -m1 '^WINDOW_ID=' "$stdout_file" | cut -d= -f2)"
        break
    fi
    sleep 0.1
done

captured=0
if [[ -n "$window_id" ]]; then
    if screencapture -x -l"$window_id" -o "$out" 2>/dev/null && [[ -s "$out" ]]; then
        captured=1
    fi
fi

kill "$pid" 2>/dev/null || true
wait "$pid" 2>/dev/null || true
rm -f "$stdout_file"

if [[ "$captured" -ne 1 ]]; then
    echo "fallback: in-process capture" >&2
    YTMP_SCREENSHOT="$out" "$bin"
fi

test -s "$out"
echo "$out"
