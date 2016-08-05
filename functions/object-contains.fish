function object-contains -a object key -d 'Checks if an object contains a key'
  if set -q $object"__$key"
    return 0
  end

  set -l prototype $object'__prototype'
  set -q $prototype
    and object-contains $$prototype $key
end
