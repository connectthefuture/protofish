function object-get -a object slot -d 'Gets the value of an object slot'
  # Fetch the values for the slot.
  set -l var (object-slot% $object $slot)
    and for value in $$var
      echo "$value"
    end
end
