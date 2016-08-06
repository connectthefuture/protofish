function lambda -S -d 'Defines a lambda function'
  set -l __name __lambda_(random)
  set -l __body $argv[-1]
  set -e argv[-1]

  function $name -S -V __body -a $argv
    eval $__body
  end

  echo $__name
end
