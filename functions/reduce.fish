function reduce -a fn current
  while set -q argv[3]
    set current (call $fn $current $argv[3])
    set -e argv[3]
  end

  echo "$current"
end
