function io:read-line -d 'read a single line'
  set -l IFS ''

  if set -q argv[1]
    builtin read -l line < $argv[1]
  else
    builtin read -l line
  end

  builtin echo -E $line
end
