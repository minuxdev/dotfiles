#!/bin/bash


NAME="print$(date +%d%m-%H%M%S)"
FORMAT="jpeg"
DIRECTORY="$HOME/screenshots"
[ ! -d "$DIRECTORY" ] && mkdir "$DIRECTORY"

grimshot() {
  while getopts "n::d::f::t:" args
  do 
    case "$args" in
      n) 
        NAME="$OPTARG"
      ;;
      d) 
        DIRECTORY="$OPTARG"
      ;;
      f)
        FORMAT="$OPTARG"
      ;;
      *) echo default
      ;;
    esac
  done
}
grim -t "$FORMAT" -g "$(slurp)" -q 100 "$DIRECTORY/$NAME.$FORMAT"
