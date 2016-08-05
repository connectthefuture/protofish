function join -a separator
  set -e argv[1]

  reduce (lambda a b '
    echo "$a,$b"
  ') $argv
end
