

//Write a function that takes a two dimensional array as the argument, turn it into a flat array and with all the duplicated elements removed. 
//Treat numbers and number strings, for example, `1` and `'1'` as duplicates, and keep the one that appear first in the flattened array. 

// #### Examples:

// ```javascript


// flattenAndUnique([[1, 2, 3], [2, 4, 5], [6]]);   // [1, 2, 3, 4, 5, 6]
// flattenAndUnique([["hello", "abc"], [true], ["abc"], [123, "123"]]);    // ["hello", "abc", true, 123]
// `

function flattenAndUnique(data) {
  // flatten the array
  var flattened = flatten(data);
  // reduce the flattened to a unique array
  var newSet = new Set(flattened);
  var unique = [];
  newSet.forEach(function(ele) {
  	unique.push(ele);
  });

  // [1, '1', 2, 3, 'hello', '3']
  // [1]
  // if '1' is == any value in [1] don't add it
  // 2 == any value in [1]? No, so append to new array => [1,2]
  // [1, 2, 3]
  // [1, 2, 3, 'hello']
  // 1 == '1'
  // for each element, I'm going to append it to a new array on the condition
  // it is not contained already in my new array. 1 == '1'
  var uniqueNumsStrings = [];
  unique.forEach(function(ele) {
    if (softNotIncluded(ele, uniqueNumsStrings)) {
        uniqueNumsStrings.push(ele);
    }
  });

  return uniqueNumsStrings;
  console.log(unique);
}

function softNotIncluded(a, arr) {
    // check that a is not in arr
    // if a not in arr retturn true
    var isIn = true;
    arr.forEach(function(ele) {
       if (ele == a) { isIn = false } // a is included
    });

    return isIn;// a is NOT included 
}

function flatten(data) {
	var flattened = []
	data.forEach(function(subarray) {
		subarray.forEach(function(ele) {
			flattened.push(ele);
		});
	});

	return flattened;
}

data = [["hello", "abc"], [true], ["abc"], [123, "123"]]
a = flattenAndUnique(data);
