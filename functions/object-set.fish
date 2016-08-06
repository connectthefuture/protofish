function object-set -a object slot value -d 'Sets the value of an object slot'
  if not set -q argv[1]
    echo "object not specified" >&2
    return 111
  end

  if not set -q argv[2]
    echo "object slot not specified" >&2
    return 111
  end

  set -e argv[1..2]

  # Set all values in the slot value.
  set -g $object"_$slot" $argv

  # Insert the slot into the index.
  if not contains -- (string replace -r -- '\[[\d.\-]+\]' '' $slot) $$object
    set -g $object $$object $slot
  end
end
