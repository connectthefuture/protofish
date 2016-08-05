function filter -a fn -d 'Filters a list with a function'
  set -e argv[1]

  for item in $argv
    if call $fn $item > /dev/null ^ /dev/null
      echo "$item"
    end
  end
end
