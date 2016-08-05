function call -S
  set -l cmd $argv[1]
  set -e argv[1]
  eval $cmd (string escape -- $argv)
end
