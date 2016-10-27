function io:read-all -d 'read the contents of files'
  set -l IFS ''

  if set -q argv[1]
    for file in $argv
      builtin read -z bytes < $file
    end
  else
    builtin read -z bytes
  end

  builtin echo -n $bytes
end
