function str:len -a string -d 'Get string length'
  builtin count (str:chars $string)
end
