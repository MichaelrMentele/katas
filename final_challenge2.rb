def combine_arrays(arr1, arr2)

	idx1 = 0
	idx2 = 0
	merged = []

	#walk down each array and compare values
	#put smaller value in new array and increment the idx
	#for array you are walking down
	#if one is empty simply add all the elements to the end
	#of the merged list, agh! I shoulda sliced!
	while arr1[idx1] != nil || arr2[idx2] != nil
		if arr1[idx1] == nil
			arr2[idx2..(arr2.length - 1)].each do |e|
				merged.push(e)
			end
			return merged
		elsif arr2[idx2] == nil
			arr1[idx1..(arr1.length - 1)].each do |e|
			merged.push(e)
			end
			return merged
		elsif arr1[idx1] > arr2[idx2]
			merged.push(arr2[idx2])
			idx2 += 1
		else
			merged.push(arr1[idx1])
			idx1 += 1
		end
	end
	return merged
end

#puts combine_arrays([1, 3, 5], [2, 4, 6]) == [1, 2, 3, 4, 5, 6]

