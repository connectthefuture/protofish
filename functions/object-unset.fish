function object-unset -a object slot -d 'Unset an object slot'
  if not set -q argv[1]
    echo "object not specified" >&2
    return 111
  end

  if not set -q argv[2]
    echo "object slot not specified" >&2
    return 111
  end

  # Erase the entry.
  set -q $object"_$slot"
    and set -e $object"_$slot"

  # Remove from the index.
  if set -l index (contains -i -- $slot $$object)
    set -e $object"[$index]"
  end
end
