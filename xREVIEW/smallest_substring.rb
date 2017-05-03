# set of character in arr
# find smallest substring, containing the set

# arr [x, y, z] str: zdkdzyxxyyzy
# {z: 1, y: 1, x: 1}
# winlen = 6
# zdkdyx xyyzy
# can we shrink?
# we try the right side, if we remove the right, we have x: 0
# we try the left side, z: 0

# {z: 0, y: 1, x: 2}
# z dkdyxx yyzy

# {z: 0, y: 2, x: 2}
# zd kdyxxy yzy

# {z: 0, y: 3, x: 2}
# zdk dyxxyy zy

# {z: 1, y: 3, x: 2}
# zdkd yxxyyz y
# valid! can we shrink?
# try the right, no, that would break it
# try the left, we can delete
# zdkdyx xyyz y
# Huzzah, we return the string sliced from those indexes
# {z: 1, y: 2, x: 1}

def substring(arr, s)
  return 0 if s.length < arr.length

  # we use this to check if an element exist
  freq = {}
  arr.each do |e|
    freq[e] = 0
  end

  i = 0
  j = 0
  while hash.values.any?(0) # O(m*n)
    char = s[j]
    freq[char] += 1 if freq[char]
    j += 1
  end

  smallest_sub = s
  for s.chars.each_with_index do |char, c1|



  end

  smallest_sub
end
