function str:split -a separator string -d 'Split string on a separator'
  set -l IFS $separator
  builtin echo -n $string | builtin read -z -l -a array
  builtin echo -ns $array\n
end
