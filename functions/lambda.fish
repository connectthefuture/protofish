function lambda
  set -l name __lambda_(random)
  set -l body $argv[-1]
  set -e argv[-1]

  function $name -S -V body -a $argv
    eval $body
  end

  echo $name
end
