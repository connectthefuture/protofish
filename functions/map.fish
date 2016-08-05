function map -a fn -d 'Applies a function to a list'
  set -e argv[1]

  for item in $argv
    call $fn $item
  end
end
