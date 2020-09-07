"""
    binary_search(array::Array{Int64,1}, target::Int64)

The binary search algorithm (BSA) finds a target value's position within a sorted array by 
using a half-interval cut per each cycle. Thus, the BSA compares the target value to the 
value of the array's middle element. In the case of inequality, the half array-piece in 
which the target cannot be will be erased. Next, the search continues on the remaining 
half array-piece and starts taking the middle element to compare it to the target value.
This procedure has to be continued until the target value is found. The search may have to 
be stopped with a remaining empty half array-piece; consequently, the target is not in the 
array. For more information see: https://en.wikipedia.org/wiki/Binary_search_algorithm

...
# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position 
...

# Examples
```julia-repl
julia> arr = [2, 3, 4, 10, 40]
julia> target = 10
julia> ClassicAlgorithmsCollections.binary_search(arr, target)
8
"""
function binary_search(array::Array{Int64,1}, target::Int64)
    left = 1
    right = length(array)

    while left <= right
        # Generating the middle element position
        mid = fld((left + right), 2)
        # If element is larger than mid, then it  can only be present in right subarray 
        if array[mid] < target
            left = mid + 1
            # If element is smaller than mid, then it can only be present in left subarray 
        elseif array[mid] > target
            right = mid - 1
            # If element is present at the middle itself 
        else
            return mid
        end
    end
    return nothing
end


"""
    binary_pivot_search(array::Array{Int64,1}, target::Int64)

The idea is to find the pivot point for finding the target in an unsorted array. For this 
reason, the array has to be divided into two subarrays; a binary search is performed on 
the subarrays.

...
# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `target::Int64`: Target-value to find the position 
...

# Examples
```julia-repl
julia> arr = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]
julia> target = 3
julia> ClassicAlgorithmsCollections.binary_pivot_search(arr, target)
8
"""
function binary_pivot_search(array::Array{Int64,1}, target::Int64)
    left = 1
    right = length(array)


    while left <= right
        # Generating the middle element position
        mid = fld((left + right), 2)

        # Check if target is hit
        if array[mid] == target
            return mid
            # Check if array is sorted from left to mid
        elseif array[left] <= array[mid]
            # Check if key lies in the left or right half
            if target >= array[left] && target <= array[mid]
                right = mid - 1
            else
                left = mid + 1
            end
            # Check if array is sorted from mid to the right
        elseif array[right] >= array[mid]
            # If array from left to mid is not sorted, array from mid to right is sorted
            if target >= array[mid] && target <= array[right]
                left = mid + 1
            else
                right = mid - 1
            end
        end
    end
    return nothing
end

"""
    bubble_sorting(array::Array{Int64,1})

The Bubble sorting algorithm (BSA) is a primitive sorting algorithm that repeatedly steps 
through the list by using a double for-loop with n and n-1 size. During the walkthrough, 
the BSA compares adjacent elements and swaps wrong ordered elements until the list is 
sorted. For more information see: https://en.wikipedia.org/wiki/Bubble_sort

...
# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
...

# Examples
```julia-repl
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.binary_pivot_search(arr, target)
[11, 12, 22, 25, 34, 64, 90]
"""
function bubble_sorting(array::Array{Int64,1})
    n = length(array)

    # Traverse through all array elements 
    for i in 1:n
        # Last i elements are already in place 
        for j in 1:n-i-1
            # traverse the array from 1 to n-i-1
            if array[j] > array[j+1]
                # Swap if the element found is greater than the next element 
                booble_swap_1 = array[j+1]
                booble_swap_2 = array[j]
                array[j], = booble_swap_1
                array[j+1] = booble_swap_2
            end
        end
    end
    return array
end

"""
    insertion_sorting(array::Array{Int64,1})

The insertion sorting algorithm builds the final sorted list by inserting elements that are 
greater than the key, to one position ahead of their current position step one item at a 
time. For more information see: https://en.wikipedia.org/wiki/Insertion_sort

...
# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
...

# Examples
```julia-repl
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.binary_pivot_search(arr, target)
[11, 12, 22, 25, 34, 64, 90]
"""
function insertion_sorting(array::Array{Int64,1})

    # Traverse through 1 to len(array) 
    for i in 2:length(array)
        # 
        key = array[i]
        j = i - 1
        while j >= 1 && key < array[j]
            array[j+1] = array[j]
            j -= 1
            array[j+1] = key
        end
    end
    return array
end

function merge(left, right)
    result = zeros(Int64, false)

    while left != [] && right != []
        if left[1] <= right[1]
            append!(result, left[1])
            left = left[2:length(left)]
        else
            append!(result, right[1])
            right = right[2:length(right)]
        end
    end


    # Either left or right may have elements left; consume them.
    # (Only one of the following loops will actually be entered.)
    while left != []
        append!(result, left[1])
        left = left[2:length(left)]
    end
    while right != []
        append!(result, right[1])
        right = right[2:length(right)]
    end
    return result
end


function merge_sorting(array::Array{Int64,1})
    # Base case. A list of zero or one elements is sorted, by definition.
    n = length(array)
    if n <= 1
        return array
    end

    # First, divide the list into equal-sized sublists
    mid = fld(n, 2)
    left = array[1:mid]
    right = array[mid+1:n]
    left = merge_sorting(left)
    right = merge_sorting(right)
    # Recursively sorting the left and right half 
    array = merge(left, right)
    n = length(array) - 1
    println(n)
    # Then merge the now-sorted left and right sublists.
    return array
end


#arr = [64, 34, 25, 12, 22, 11, 90]

arr = [12, 11, 13, 5, 6, 7]
# sol = [ 5, 6, 7, 11, 12, 13]
println(merge_sorting(arr))
