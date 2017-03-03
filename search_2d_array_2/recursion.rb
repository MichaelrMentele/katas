# # @param {Integer[][]} matrix
# # @param {Integer} target
# # @return {Boolean}
#
# require 'pry'
#
# def search_matrix(matrix, target)
#     return false if matrix.length == 0
#     p matrix
#     # We want to do two binary searches
#     # First we search by row
#     start_row = 0
#     end_row = matrix.length - 1
#
#     if end_row < start_row
#       return false
#     end
#
#
#     mid_row = start_row + (end_row - start_row) / 2
#     puts mid_row
#     # else we have more than one row...
#     if start_row == end_row
#         return search_row(matrix[start_row], target)
#     elsif (target >= matrix[mid_row][0] && target <= matrix[mid_row][-1])
#         return search_row(matrix[mid_row], target)
#     elsif target < matrix[mid_row][0]
#         # calculate new max (throw away top half)
#         new_matrix = matrix.slice(start_row, mid_row) # not inclusive
#         search_matrix(new_matrix, target)
#     elsif target > matrix[mid_row][-1]
#         # calculate new min (throw away bottom half)
#         new_matrix = matrix.slice(mid_row + 1, end_row + 1) # not inclusive
#         search_matrix(new_matrix, target)
#     end
# end
#
# #[1 , 2]
# def search_row(row, target)
#     # 1, 1 ->  2
#     return false if row.length == 0
#
#     start = 0
#     last = row.length - 1 # 1
#
#     while last >= start do
#         mid = start + (last - start) / 2 # 0
#
#         if row[mid] == target
#             return true
#         elsif row[mid] < target
#             #throw away bottom#
#             start = mid + 1
#         elsif row[mid] > target
#             # throw away top
#             last = mid - 1 #
#         end
#     end
#
#     return false
# end
#
# puts search_matrix([[1],[3]], 1)
