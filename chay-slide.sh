#!/usr/bin/env bash
# Chạy slide 20/10 qua localhost để video YouTube nhúng được.
cd "$(dirname "$0")" || exit 1
PORT=8010
python3 -m http.server "$PORT" >/dev/null 2>&1 &
SRV=$!
sleep 1
URL="http://localhost:$PORT/index.html"
echo "Slide đang chạy tại: $URL"
echo "Đóng cửa sổ terminal này khi xong để tắt server."
(xdg-open "$URL" || google-chrome "$URL") >/dev/null 2>&1
trap 'kill $SRV 2>/dev/null' EXIT
wait $SRV
