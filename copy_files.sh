copy() {
  err=$(cp $1 $2 2>&1)
  if [ $? -eq 0 ]
  then
    echo "\xE2\x9C\x85  cp: $1 to $2"
  else
    echo "\xE2\x9D\x8C  $err"
  fi
}

copy .zshrc ~/.zshrc
copy .nvimrc ~/.nvimrc
copy .gitconfig  ~/.gitconfig
copy keymap.cson  ~/.atom/keymap.cson
