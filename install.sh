#!/bin/bash

# PDF Highlight Extractor - Install Script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_PATH="$SCRIPT_DIR/highlight_extractor.py"

echo "Installing PDF Highlight Extractor..."

# Install Python dependencies
echo "Installing Python dependencies..."
pip3 install PyMuPDF python-docx

# Make script executable
chmod +x "$SCRIPT_PATH"

# Detect shell config file
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.bash_profile"
fi

# Add alias if not already present
ALIAS_CMD="alias highlights='python3 $SCRIPT_PATH'"

if grep -q "alias highlights=" "$SHELL_RC" 2>/dev/null; then
    echo "Alias 'highlights' already exists in $SHELL_RC"
else
    echo "" >> "$SHELL_RC"
    echo "# PDF Highlight Extractor" >> "$SHELL_RC"
    echo "$ALIAS_CMD" >> "$SHELL_RC"
    echo "Added alias 'highlights' to $SHELL_RC"
fi

echo ""
echo "Installation complete!"
echo ""
echo "Restart your terminal or run:"
echo "  source $SHELL_RC"
echo ""
echo "Then use:"
echo "  highlights document.pdf"
echo "  highlights document.pdf -f txt"
echo "  highlights document.pdf -f docx"
