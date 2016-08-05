function object-keys -a object -d 'Iterate over object keys'
  set -q argv[1]
    or return 111

  for key in $$object
    echo $key
  end
end
