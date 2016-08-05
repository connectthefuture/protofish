function object-values -a object -d 'Iterate over object values'
  set -q argv[1]
    or return 111

  for key in $$object
    set -l lookup $object"__$key"
    echo $$lookup
  end
end
