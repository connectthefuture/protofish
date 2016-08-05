function object-set -a object key value -d 'Sets the value of an object key'
  set -q argv[3]
    or return 111

  # Set all values in the key value.
  set -g $object"__$key" $argv[3..-1]

  # Insert the key into the index.
  if not contains -- $key $$object
    set -g $object $$object $key
  end
end
