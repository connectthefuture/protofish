function dirname -d 'strip last component from file name'
  set -l IFS /

  for path in $argv
    set -l prefix ''
    switch $path
      case '/*'
        set prefix /
    end

    echo -E $path | read -la components

    if not set -q components[2]
      test $prefix = /
        and echo /
        or echo .
    else
      echo -n $prefix

      if not set -q components[3]
        echo -E $components[1]
      else
        echo -n $components[1..-3]/
        echo -E $components[-2]
      end
    end
  end
end
