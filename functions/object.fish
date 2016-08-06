function object -d 'Creates a new object'
  # Create global object name.
  set -l object __object_(random)
  set -g $object

  # Set object prototypes.
  if set -q argv[1]
    object-set $object prototype $argv
  end

  # Return an object reference.
  echo $object
end
