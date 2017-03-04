// Merge Sort

// Sort an array of passed in values using merge sort. 
// You can assume that this array may contain only one type 
// of data. And that data may be either all numbers or all strings.

// Merge sort is a recursive sorting algorithm that works by 
// breaking down the array elements into nested sub-arrays, 
// then recombining those nested sub-arrays in sorted order. 
// It is best shown by example. For instance, let's merge sort 
// the array [9,5,7,1]. Breaking this down into nested sub-arrays, 
// we get:

// [9, 5, 7, 1] ->
// [[9, 5], [7, 1]] -> [[i0, i1], [i2, i3]]
// [[[9], [5]], [[7], [1]]]
// We then work our way back to a flat array by merging each 
// pair of nested sub-arrays:

// [[[9], [5]], [[7], [1]]] ->
// [[5, 9], [1, 7]] ->
// [1, 5, 7, 9]
// Examples:

// merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
// merge_sort([5, 3]) == [3, 5]
// merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
// merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
// merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]


////////////////
// Psuedocode //
////////////////

// [2, 1, 4, 5]
// split the array until all arrays are of length one
// [5, 1, 3 ... n]
// [[5, 1, 3 ... n/2], [... n/2]]
// until n/ith is of length 1 is the number of splits = n - 1?

// [2, 1, 4, 5, 6, 7]
// [3]
// [2][1]
// [1][1][1]

// split the array into sublists
    // split array into two sublists until the array is of length 1
    // [1, 2, 3, 4].length === 4, sublist1 = 0..n/2, sublist2 = n/2..end
    // sublist1.length === 2, sublist1_1 = 0..n/2, sublist2 = n/2...end
    // if sublist.length === 1, return sublist 
// recombine into a sorted list
    // [[9],[5]] 
    // for each element, get element, compare to next element
    // if ele1 > ele2
    // return [ele2, ele1] otherwise [ele1, ele2]

    // [[[9], [5]], [[7], [1]]] ->
    
    // [[5, 9], [1, 7]] -> is 5 less than 1? no, then 1  [1, 5, 7, 9]
    // compare leftmost elements in either array, the smallest is pushed to new array first

    // [1, 5, 7, 9]

    // until no subarrays -> is any value an array?
        // get subarrays
        // compare subarrays from left to right and push in order to new array

//////////
// Code //
//////////

function split(array) {
    // [] -> [[[][]][[][]]]
    if (array.length === 1) { return array; }
    else {
        var subArray1 = array.slice(0, array.length/2);
        var subArray2 = array.slice(array.length/2, array.length);
        return [split(subArray1), split(subArray2)];
    }
}

function mergeSort(array) {
    // [[][]] -> []
    // if no sublists, then done
    if (!hasSublist(array)) { return array; }
    // if sublists that have sublists, get sublists, unti 2 sublists that have no sublists then merge 
    else {
        var sub1 = array[0];
        var sub2 = array[1];
        if(!hasSublist(sub1) && !hasSublist(sub2)) {
            return merge(sub1, sub2);
        } else {
            return merge(mergeSort(sub1), mergeSort(sub2));
        }
    }

}

function hasSublist(array) {
    return (array[0] instanceof Array);
}

function merge(arr1, arr2) {
    // [] + [] = [] 
    if (arr1.length > arr2.length) { var length = arr1.length }
    else { var length = arr2.length}

    var sorted = []
    for( var index = 0; index < length; index++ ) {
        if (arr1[index] < arr2[index]) { 
            sorted.push(arr1[index]);
            sorted.push(arr2[index]); 
        } 
        else { 
            sorted.push(arr2[index]); 
            sorted.push(arr1[index]);
        }
    }

    return sorted;
}

a = split;
b = mergeSort;

