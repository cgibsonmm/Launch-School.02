# Write a method that rotates an array by moving the first element to
# the end of the array. The original array should not be modified.

# defing method that accepts array
# itterate through the array while shifing and pushing item back to arrary
# return the rotated arr

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
