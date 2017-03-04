///////////////////////
// Problem Statement //
///////////////////////

Bubble Sort

Bubble Sort is one of the simplest sorting algorithms available. 
It isn't an efficient algorithm, but it's a great exercise for 
student developers. In this exercise, you will write a method that 
does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) 
through the Array. On each pass, each pair of consecutive elements 
is compared. If the first of the two elements is greater than the 
second, then the two elements are swapped. This process is repeated 
until a complete pass is made without performing any swaps; at that 
point, the Array is completely sorted.

6	2	7	1	4	Start: compare 6 > 2? Yes
2	6	7	1	4	Exchange
2	6	7	1	4	6 > 7? No (no exchange)
2	6	7	1	4	7 > 1? Yes
2	6	1	7	4	Exchange
2	6	1	7	4	7 > 4? Yes
2	6	1	4	7	Exchange
2	6	1	4	7	2 > 6? No
2	6	1	4	7	6 > 1? Yes
2	1	6	4	7	Exchange
2	1	6	4	7	6 > 4? Yes
2	1	4	6	7	Exchange
2	1	4	6	7	6 > 7? No
2	1	4	6	7	2 > 1? Yes
1	2	4	6	7	Exchange
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	1 > 2? No
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	No swaps; all done; sorted
We can stop iterating the first time we make a pass through 
the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that 
demonstrates the algorithm as well as a minor optimization 
technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and 
sorts that Array using the bubble sort algorithm as just 
described. Note that your sort will be "in-place"; that is, 
you will mutate the Array passed as an argument. You may 
assume that the Array contains at least 2 elements.

Examples

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

////////////////
// Psuedocode //
////////////////
// walk down array, compare values swap value pairs that aren't in order
// continue until no swaps are made

// from index 0 to end of array do 
	// swapped = false;
	// if i + 1 < i THEN swap
		// temp1 = [i + 1]
		// temp2 = [i]
		// array[i + 1] = temp2
		// array[i] = temp1
		// swapped = true;
	// i++

	// if swapped = false return array


//////////
// Code //
//////////

function bubbleSortAsc(array) {
	while(true) {
		var swapped = false;
		var temp1, temp2;
		for (var i = 0; i < array.length - 2; i++) {
			if (array[i + 1] < array[i]) {
				temp1 = array[i];
				temp2 = array[i + 1];
				array[i] = temp2;
				array[i + 1] = temp1;
				swapped = true;
			}

			if (!swapped) { return array; }
		}
	}
}
