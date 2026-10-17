#!/bin/bash
#set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

"$SCRIPT_DIR/dependencies/install.sh" &&
  "$SCRIPT_DIR/file_managers/install.sh" &&
  "$SCRIPT_DIR/text_editors/install.sh" &&
  "$SCRIPT_DIR/desktop_environment/install.sh" &&
  "$SCRIPT_DIR/terminal/install.sh"
