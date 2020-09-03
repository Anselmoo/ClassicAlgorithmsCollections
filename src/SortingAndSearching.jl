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
- `array::Array{Int64,1}`: Sorted array of integers
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
