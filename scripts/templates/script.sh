#!/bin/bash

# Variables
SCRIPT="${BASH_SOURCE[0]}"
DEBUG=false

# Return an ISO 8601 UTC timestamp (local timezone)
function timestamp {
  date +%FT%T%Z
}

# Prints a debug message if $DEBUG is true, otherwise does nothing
function debug {
  if [ $DEBUG = true ]; then printf "%s\tDEBUG:\t%s\n" "$(timestamp)" "$1"; fi
}

# Handle arguments
function parse_arguments {
  while [[ $# -gt 0 ]]; do
    case $1 in
      -d|--debug)
      DEBUG=true
      shift
      ;;
      # -x|--xxx)
      # xxx="$2"
      # shift
      # ;;
      *)
      # Unknown option
      ;;
    esac
  done
}

# Main script logic
function main {
  echo "Hello, world!"

  # Exit with success
  end
}

# Logic that occurs when the script is first executed
function start {
  parse_arguments "$@"
  debug "Starting $SCRIPT ... "
  main
}

# Logic that occurs when the script has finished executing main
function end {
  debug " ... done."
  exit 0
}

# Script main entry point
start "$@"
