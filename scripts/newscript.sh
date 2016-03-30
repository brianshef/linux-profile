#!/bin/bash

# Variables
SCRIPTS_DIR="$HOME/scripts"
TEMPLATES_DIR="$SCRIPTS_DIR/templates"
TEMPLATE="$TEMPLATES_DIR/script.sh"
SCRIPT="$SCRIPTS_DIR/$1.sh"
EDITOR="atom"

cp "$TEMPLATE" "$SCRIPT"
chmod u+x "$SCRIPT"
echo "Created new script $SCRIPT from template $TEMPLATE ."
$EDITOR "$SCRIPT"
