function str:join -a separator
  if set -q argv[2]
    builtin echo -n $argv[2]
  end

  if set -q argv[3]
    builtin echo -ns $separator$argv[3..-1]
  end
end
