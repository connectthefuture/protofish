function basename -d 'strip directory and suffix from filenames'
  set -l IFS /

  for path in $argv
    echo -E $path | read -la components
    echo -E $components[-1]
  end
end
