function list -S -d 'Creates a list'
  set -l __ifs "$IFS"
  set IFS "\0"

  for arg in $argv
    echo "$arg"
  end

  set IFS "$__ifs"
end
