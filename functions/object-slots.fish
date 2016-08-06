function object-slots -a object -d 'Iterate over object slots'
  if not set -q argv[1]
    echo "object not specified" >&2
    return 111
  end

  for slot in $$object
    echo $slot
  end
end
