function object-slot% -a object slot -d 'Fetches the global storage variable for an object slot'
  if not set -q argv[1]
    echo "object not specified" >&2
    return 111
  end

  if not set -q argv[2]
    echo "object slot not specified" >&2
    return 111
  end

  # Lookup the slot inside this object.
  set -l lookup $object"_$slot"
  if set -q $lookup
    echo $lookup
    return 0
  end

  # If object has no prototype, the ket cannot be found. This is our base case.
  set -l prototype $object'_prototype'
  if not set -q $prototype
    return 1
  end

  # slot not present in this object, so recursively lookup slot in object prototypes.
  for parent in $$prototype
    object-slot% $$prototype $slot
      and return
  end
end
