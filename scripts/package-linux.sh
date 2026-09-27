#!/usr/bin/env bash
set -euo pipefail

RID="${1:-linux-x64}"
OUTPUT_DIR="${2:-artifacts/release/$RID}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PUBLISH_DIR="$ROOT/artifacts/publish/$RID"

case "$RID" in
  linux-x64|linux-arm64) ;;
  *) echo "Unsupported runtime identifier: $RID" >&2; exit 2 ;;
esac

mkdir -p "$OUTPUT_DIR"

# Create tarball from published output
TARBALL_PATH="$OUTPUT_DIR/AsterDock-$RID.tar.gz"
cd "$PUBLISH_DIR"
tar czf "$TARBALL_PATH" .

echo "Created: $TARBALL_PATH"
ls -la "$TARBALL_PATH"
