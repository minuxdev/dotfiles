#!/bin/bash


PRINT=$(printf "
MENU\n\n

1. DESKTOP ENVIRONMENT / WINDOWS MANAGER\n
2. DEPENDENCIES\n
3. NETWORKING\n
4. TERMINAL EMULATOR\n
5. UTILITIES\n
6. FILE MANAGERS\n
7. PROGRAMMING\n
q. EXIT\n
============================================\n
"
)
echo $PRINT

while read -p "Select option: " OPTION
do 
  case "$OPTION" in
    1) 
        $HOME/dotfiles/dewm/installer.sh
        echo $PRINT
        continue
    ;;
    2)
        $HOME/dotfiles/dependencies/installer.sh
        echo $PRINT
        continue
    ;;
    3)
        $HOME/dotfiles/networking/installer.sh
        echo $PRINT
        continue
      ;;
    4)
        $HOME/dotfiles/terminal_emulator/installer.sh
        echo $PRINT
        continue
    ;;
    5)
        $HOME/dotfiles/utilities/installer.sh
        echo $PRINT
        continue
    ;;
    6)
        $HOME/dotfiles/file_managers/installer.sh
        echo $PRINT
        continue
    ;;
    7)
        $HOME/dotfiles/programming/installer.sh
        echo $PRINT
        continue
    ;;
  'q')
        break 
    ;;
    *) 
        echo $PRINT
       printf "INVALID OPTION!\n"
        continue
    ;;
  esac

done
