trash() {
  _TRASH_PATH=${TRASH_PATH:-${HOME}/.Trash}
  if [ ! -d $_TRASH_PATH ];then
      mkdir -p $_TRASH_PATH
  fi
  mv -i $@ $_TRASH_PATH
}

