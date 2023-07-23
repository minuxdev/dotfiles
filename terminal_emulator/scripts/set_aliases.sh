#!/bin/bash
#
set_aliases()
{
  if [ ! $# -gt 0 ] 
  then
    printf "No alias provided! Provide a valid alias."
    return 5
  else
    for _alias in "$@"
    do 
      sed -i " /ALIASES/ a alias ${_alias} " ~/.zshrc
    [ ! $? = 0] && 
      printf "\nSorry! Could not create alias for ${_alias}!\n" ||
      printf "\nAlias created!\n" 
    done
    source ~/.zshrc
  fi
}

set_aliases "$@" 
