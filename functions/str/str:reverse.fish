function str:reverse -a string
  set -l chars (str:chars $string)
  builtin echo -ns $chars[-1..1]
end
