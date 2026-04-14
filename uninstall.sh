#!/usr/bin/env bash

echo ""
echo "🧹 Uninstalling pip-analyzer..."

INSTALL_DIR="$HOME/.local/share/pip-analyzer"
BIN_FILE="$HOME/.local/bin/pip-analyze"

rm -rf "$INSTALL_DIR"
rm -f "$BIN_FILE"

echo "✅ Removed pip-analyzer files"

echo ""
echo "🎯 Uninstall complete"
echo ""