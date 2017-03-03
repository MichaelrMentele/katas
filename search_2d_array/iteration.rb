# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    return false if matrix.length == 0

    # We want to do two binary searches
    # First we search by row
    start_row = 0
    end_row = matrix.length - 1


    while end_row >= start_row do
       
        # We can get a target, go to the middle row
        mid_row = start_row + (end_row - start_row) / 2
        puts mid_row
        # else we have more than one row...
        if start_row == end_row
            return search_row(matrix[start_row], target)
        elsif (target >= matrix[mid_row][0] && target <= matrix[mid_row][-1])
            return search_row(matrix[mid_row], target)
        elsif target < matrix[mid_row][0]
            # calculate new max (throw away top half)
            end_row = mid_row - 1
        elsif target > matrix[mid_row][-1]
            # calculate new min (throw away bottom half)
            start_row = mid_row + 1
        end
    end

    return false

    # check there are rows, if not return false
    # set start to the index of first row
    # set end to the index of last row
    # until the end index isn't less than start index, continue if it is then value doesnt exist so return false
        # calculate the middle row as the average between the index of the start and end rows
        # if there is only one row left to check, binary search it
        # otherwise if the target is within the range of the guessed row, then search it
        # otherwise if the target is below the range of the guess..
            # We can throw away the top
        # otherwise if the target is above the row
            # throw away the bottom
end

#[1 , 2]
def search_row(row, target)

    # 1, 1 ->  2
    return false if row.length == 0

    start = 0
    last = row.length - 1 # 1

    while last >= start do
        mid = start + (last - start) / 2 # 0

        if row[mid] == target
            return true
        elsif row[mid] < target
            #throw away bottom#
            start = mid + 1
        elsif row[mid] > target
            # throw away top
            last = mid - 1 #
        end
    end

    return false
end

search_matrix([[1],[3]], 1)
