function str:substr -a string start length
  set -l chars (str:chars $string)
  set chars $chars[$start..-1]

  if builtin test -n "$length"
    set chars $chars[1..$length]
  end

  builtin echo -ns $chars[$start..-1]
end
