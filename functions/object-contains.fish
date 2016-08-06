function object-contains -a object slot -d 'Checks if an object slot exists'
  set -l dummy (object-slot% $object $slot)
end
