def my_function(arr):

	# The product is equal to 1 * the product before the index
    # product at icur = product at all i < icur * 1 * i > icur

    # compute products BEFORE at each index
    # I: [1, 2, 3, 4]
    # O: [1, 1, 2, 6]
    before_products_arr = [0] * len(arr)
    i = 0
    product = 1
    while i < (len(arr)):
        before_products_arr[i] = product
        product *= arr[i]
        i += 1

    print before_products_arr
    # compute products AFTER each index
    # I: [1, 2, 3, 4]
    # O: [24, 12, 4, 1]
    after_products_arr = [0] * len(arr)
    product = 1
    i = len(arr) - 1
    while i >= 0:
        after_products_arr[i] = product
        product *= arr[i]
        i -= 1

    # combining both arrays by multiplying each index by each index
    # [1, 1, 2, 6]
    # [24, 12, 4, 1]
    # result: [24, 12, 8, 6]
    result = [0] * len(arr)

    while i < (len(arr) - 1):
      result[i] = before_products_arr[i] * after_products_arr[i]
      i += 1

    return result
# run your function through some test cases here
# remember: debugging is half the battle!
print my_function([1,2,3,4])
