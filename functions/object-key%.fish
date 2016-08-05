function object-key% -a object key -d 'Fetches the global storage variable for an object key'
  # Lookup the key inside this object.
  set -l lookup $object"__$key"
  if set -q $lookup
    echo $lookup
    return 0
  end

  # If object has no prototype, the ket cannot be found. This is our base case.
  set -l prototype $object'__prototype'
  if not set -q $prototype
    return 1
  end

  # Key not present in this object, so recursively lookup value in object prototype.
  object-get $$prototype $key
end
