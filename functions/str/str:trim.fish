function str:trim -a string
  set -l chars (str:chars $string)
  echo $chars

  while builtin test "$chars[1]" = ' '
    set -e chars[1]
  end

  while builtin test "$chars[-1]" = ' '
    set -e chars[-1]
  end

  builtin echo -ns $chars
end
