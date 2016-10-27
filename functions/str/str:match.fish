function str:match -a string pattern
  switch $string
    case $pattern
      return 0
  end
  return 1
end
