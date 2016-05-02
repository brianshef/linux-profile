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
      # TODO: Allow these options
      # -r|--repo)
      # REPO_NAME="$2"
      # echo "REPO_NAME=${REPO_NAME}"
      # shift
      # ;;
      # -v|--version)
      # RC="$2"
      # echo "RC=${RC}"
      # shift
      # ;;
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
  echo "Ready to check a repo for changes to a release candidate ... "
  if [ -z "${REPO_NAME}" ]; then
    read -p "Repo name to check: " REPO_NAME
  fi
  if [ -z "${RC}" ]; then
    read -p "RC version to check: " RC
  fi
  RC_BRANCH="rc/${RC}"
  GITHUB_ROOT="$HOME/GitHub/rewardStyle"
  GIT_BASE_URL="https://github.com/rewardStyle"
  REPO="${GIT_BASE_URL}/${REPO_NAME}.git"
  debug "vars: REPO_NAME=${REPO_NAME} RC=${RC} RC_BRANCH=${RC_BRANCH} GITHUB_ROOT=${GITHUB_ROOT} GIT_BASE_URL=${GIT_BASE_URL} REPO=${REPO}"
  echo " ... checking ${REPO} for ${RC_BRANCH} ... "

  # Ensure git repo is cloned
  echo "Cloing "
  pushd "${GITHUB_ROOT}"
  git clone "${REPO}"
  cd "${REPO_NAME}"
  git checkout master && git reset --hard && git pull
  popd

  # Check the status of the RC
  pushd "${GITHUB_ROOT}/shell"
  git checkout master && git pull
  perl qa/git_changes_to_jira.pl --role=release-manager "${REPO_NAME}" "${GITHUB_ROOT}/${REPO_NAME}" /origin/master /origin/"${RC_BRANCH}" --status
  popd
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
