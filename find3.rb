# array of integers: a[1, 5, 8, -9, -4, -3, 0, 1, 0]
#                      0  1  2   3   4   5  6  7  8
# we are given an integer X.
# i < j < k: a[i] + a[j] + a[k] == X
# Example: X == 1: [0, 6, 8] -> a[0] + a[6] + a[8] == 1 +0 + 0 == 1
# Example: X == 50: None
#

# 3 unique indices
# such that the valus at those indices add up to x
# no duplicate indices

# Brute force
# O(n^3)

# O(n^2)
# X = 1 + b + c
# X - 1 = b + c
# 5 + y = b + c

# [0, 0, 0, 0, 0, 0, 0, ...] X == 0

def find3(a, X)
    # scan through array
    # build hash storing complement in each key
    complements = {}
    a.each_with_index do |val, ind|
        if complements[X - val]
            complements[X - val].push(ind)
        else
            complements[X - val] = [ind]
        end
    end

    # scan through the array again
    # get complement
    # for each value scan the remainder of the arrray
    # for a value such taht a + b = the complement

    # for each character we have built a dictionary such that, we can find
    # x = a + complement

    # [1, 2, 3]
    # 1 + 2 = 3
    # 1 + 3 = 4 =>

    # for each value in the array (a) look at all following values (b) and see if a + b
    # is in the dictionary, if it is, check that their indices do not collide with the index
    # stored at dict(a+b)

    a.each_with_index do |va, i|
        a.each_with_index do |vb, j|
            break if i == j

            complement = va + vb
            indices = complements[complement]

            indices.each do |z|
                # every index is unique
                return [i, j, z] unless z == i || z == j
            end
        end
    end

    return nil
end

# time bound exercises
# think thru
# whiteboarding 
