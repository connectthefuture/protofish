function object-unset -a object key -d 'Unset an object key'
  set -q argv[2]
    or return 111

  # Erase the entry.
  set -e $object"__$key"

  # Remove from the index.
  if set -l index (contains -i -- $key $$object)
    set -e $object"[$index]"
  end
end
