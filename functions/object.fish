function object -a prototype -d 'Creates a new object'
  set -l object __object_(random)
  set -g $object

  # If given, set object prototype.
  if set -q argv[1]
    object-set $object prototype $prototype
  end

  echo $object
end
