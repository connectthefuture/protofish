function object-values -a object -d 'Iterate over object values'
  for slot in (object-slots $object)
    echo (object-get $object $slot)
  end
end
