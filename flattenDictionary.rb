def flattenDict(initialKey, dictionary, flatdictionary)
  for key in dictionary.keys do 
    value = dictionary.get(key)

    if (!value.is_hash?) // the value is primitive
      if (initialKey==nil||initialKey=="")
         flatDictionary.put(key, value)
      else
         flatDictionary.put(initialKey + "." + key, value)
      end
    else
      if(initialKey == null ||initialikey=="")
         flattenDicitonary(key, value, flatDictionary)
      else
         flattenDictionary(initialKey + "." + key, value, flatDicitonary)
      end
    end

  end
end

{
        a: "blah",
        b: { c: "test" }
}

key1.a: blah
key1.b.c: "test"

for each value at a key, check if it's values are dictionaries
key1: is it's value a dict? yes
each key in dict, is it's value a dict
if no
  return key1 + "." + "a"


