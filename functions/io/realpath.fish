if type -q fish_realpath
  function realpath -d 'print the resolved path'
    fish_realpath $argv
  end
else
  function realpath -d 'print the resolved path'
    command realpath $argv
  end
end
