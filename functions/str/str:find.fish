function str:find -a haystack needle
  set -l haystack_chars (str:chars $haystack)
  set -l needle_chars (str:chars $needle)
  set -l needle_length (builtin count $needle_chars)
  set -l search_region $haystack_chars

  while set -l start (builtin contains -i -- $needle_chars[1] $search_region)
    if not set -q needle_chars[2]
      echo $start
      return 0
    end

    set search_region $search_region[$start..-1]
    set -e search_region[1]
    set -l search_queue $search_region

    for char in $needle_chars[2..-1]
      if not set -q search_queue[1]
        break
      end

      if builtin test "$search_queue[1]" != "$char"
        break
      end

      set -e search_queue[1]
    end
  end

  return 1

  for i in (command seq 1 (builtin count $haystack_chars))
    set -e not_found
    set -l j $i

    for char in $needle_chars
      if builtin test "$haystack_chars[$j]" != "$char"
        set not_found
        break
      end
      set j (math "$j + 1")
    end

    if not set -q not_found
      builtin echo $i
      return 0
    end
  end

  return 1
end
