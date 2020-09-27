"""
    binary_search(array::Array{Int64,1}, target::Int64)

The binary search algorithm (BSA) finds a target value's position within a sorted array by 
using a half-interval cut per each cycle. Thus, the BSA compares the target value to the 
value of the array's middle element. In the case of inequality, the half array-piece in 
which the target cannot be will be erased. Next, the search continues on the remaining 
half array-piece and starts taking the middle element to compare it to the target value.
This procedure has to be continued until the target value is found. The search may have to 
be stopped with a remaining empty half array-piece; consequently, the target is not in the 
array. For more information see: [https://en.wikipedia.org/wiki/Binary_search_algorithm](https://en.wikipedia.org/wiki/Binary_search_algorithm)


# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position 


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10,11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
julia> target = 12
julia> ClassicAlgorithmsCollections.binary_search(arr, target)
3
```
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


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `target::Int64`: Target-value to find the position 


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]
julia> target = 3
julia> ClassicAlgorithmsCollections.binary_pivot_search(arr, target)
8
```
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
    interpolation_searching(array::Array{Int64,1}, target::Int64)

The Interpolation search algorithm (ISA) finds a target-position in a sorted array by using 
a numerical procedure. The sorting procedure uses a linear fitting for finding the target 
position of the remaining search space in the array in more detail. The array's target 
position is calculated by the straight slope between the lowest and largest boundary of the 
remaining array and the lowest array position itself during each optimization cycle. If the 
target-position cannot be found, the array-space will be shrink for the lower or higher 
boundary region based on a comparison. For more information see: [https://en.wikipedia.org/wiki/Interpolation_search](https://en.wikipedia.org/wiki/Interpolation_search)


# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position 


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10,11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
julia> target = 12
julia> ClassicAlgorithmsCollections.interpolation_searching(arr, target)
3
```
"""
function interpolation_searching(array::Array{Int64,1}, target::Int64)
    # Find indexs of two low and high array-boundary 
    low = 1
    high = length(array)

    # Since array is sorted, an element present in array must be in range defined by boundary 
    while low <= high && target >= array[low] && target <= array[high]

        # Check if array contains only one element
        if low == high
            if array[low] == target
                return low
            end
            return nothing
        end

        # Linear fitting of the new position pos and transforming to an integer value. 
        pos =
            low + floor(
                Int64,
                ((float(high - low) / (array[high] - array[low])) * (target - array[low])),
            )

        #  Check if target is now found
        if array[pos] == target
            return pos
        end

        # If x is larger, x is in upper part 
        if array[pos] < target
            low = pos + 1
            # Else x has to be smaller, x is in lower part 
        else
            high = pos - 1
        end
    end
    # If target is not in the list
    return nothing
end


"""
    closest_pair_searching(array::Array{Int64,1}, target::Int64)

Finding the closet pair of values for a given target in a sorted array. For this reason, 
the distance between a pair of of values has to be minimazied with respect to the target.
For more information see: [https://en.wikipedia.org/wiki/Closest_pair_of_points_problem](https://en.wikipedia.org/wiki/Closest_pair_of_points_problem)


# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position 


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10, 22, 28, 29, 30, 40]
julia> target = 56
julia> ClassicAlgorithmsCollections.closest_pair_searching(arr, target)
(28, 29)
```
"""
function closest_pair_searching(array::Array{Int64,1}, target::Int64)

    # To store indexes of result pair 
    res_left, res_right = 1, 1

    #Initialize left, right array boundaries, and their difference 
    left, right, diff = 1, length(array), 999999

    # While there are elements between left and right array boundaries 
    while right > left
        
        # Check if the distance between the current pair is closer than the closest 
        # previous pair so far 
        if abs(array[left] + array[right] - target) < diff
            res_left = left
            res_right = right
            # If yes update the distance
            diff = abs(array[left] + array[right] - target)
        end

        # If this pair has more sum than the target, shrink the array to a smaller value 
        if array[left] + array[right] > target
            
            right -= 1
        # Otherwise, shrink the array to a larger value
        else
            left += 1
        end
    end
    return array[res_left], array[res_right]
end

"""
    bubble_sorting(array::Array{Int64,1})

The Bubble sorting algorithm (BSA) is a primitive sorting algorithm that repeatedly steps 
through the array by using a double for-loop with n and n-1 size. During the walkthrough, 
the BSA compares adjacent elements and swaps wrong ordered elements until the array is 
sorted. For more information see: [https://en.wikipedia.org/wiki/Bubble_sort](https://en.wikipedia.org/wiki/Bubble_sort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.bubble_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
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
                array[j], array[j+1] = array[j+1], array[j]
            end
        end
    end
    return array
end


"""
    insertion_sorting(array::Array{Int64,1})

The insertion sorting algorithm builds the final sorted array by inserting elements that are 
greater than the key, to one position ahead of their current position step one item at a 
time. For more information see: [https://en.wikipedia.org/wiki/Insertion_sort](https://en.wikipedia.org/wiki/Insertion_sort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.insertion_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
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


"""
    merge(left::Array{Int64,1}, right::Array{Int64,1}))

The merge algorithms (MA) merge the subarrays `left` and `right` to produce new sorted 
subarrays until there is only one subarray remaining, which will be the sorted array. For
more information see: [https://en.wikipedia.org/wiki/Merge_sort](https://en.wikipedia.org/wiki/Merge_sort)


# Arguments
- `left::Array{Int64,1}`: Unsorted left part of the array
- `right::Array{Int64,1}`: Unsorted right part of the array

"""
function merge(left::Array{Int64,1}, right::Array{Int64,1})
    result = zeros(Int64, false)
    # Left and right may have elements left; consume them.
    while left != [] && right != []
        # Check if left is smaller than right, if yes append
        if left[1] <= right[1]
            append!(result, left[1])
            left = left[2:length(left)]
        else
            # If not mix the order of left and right
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


"""
    merge_sorting(array::Array{Int64,1})

The merge sort algorithms (MSA) are a comparison-based sorting algorithm, which is referred 
to as the divide and conquer algorithms.  The stable sort implementation is a widely used 
method for the MSA, which means that the order of equal elements is the same in the input 
and output. In the current implementation, a top-down implementation is used; however, a 
Bottom-up implementation can be used, too. In the top-down implementation, the MSA 
recursively splits the array into subarrays until the subarray size is < 2, merging those 
subarrays to produce a sorted array by using a new function `merge`. The back copying is 
blocked by alternating the direction of the merge with each recursion. For more information 
see: [https://en.wikipedia.org/wiki/Merge_sort](https://en.wikipedia.org/wiki/Merge_sort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.merge_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function merge_sorting(array::Array{Int64,1})
    # Base case. A array of zero or one elements is sorted, by definition.
    n = length(array)
    if n < 2
        return array
    end

    # First, divide the array into equal-sized subarrays
    mid = fld(n, 2)
    left = array[1:mid]
    right = array[mid+1:n]
    # Recursively sorting the left and right half
    left = merge_sorting(left)
    right = merge_sorting(right)
    # Then merge the now-sorted left and right subarrays.
    array = merge(left, right)
    # Finally return the sorted array
    return array
end


"""
    heapify(array::Array{Int64,1})

The heapify function merges the two subroutines for:
    1) Put elements of the array in heap order
    2) Repair the heap elements `i` whose root element, if is not at the index `largest`
For more information see: https://en.wikipedia.org/wiki/Heapsort


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `n::Int64`: Length of the array
- `i::Int64`: Current index of the array

"""
function heapify(array::Array{Int64,1}, n::Int64, i::Int64)
    # Initialize largest as root and left and right subarrays
    largest = i
    # Julia notations, which starts with 1
    left = 2 * i
    right = 2 * i + 1

    # See if left child of root exists and is greater than root 
    if left <= n && array[i] < array[left]
        largest = left
    end
    # See if right child of root exists and is greater than root 
    if right <= n && array[largest] < array[right]
        largest = right
    end
    # Change root, if needed 
    if largest != i
        array[i], array[largest] = array[largest], array[i]
        # Heapify the root again 
        array = heapify(array, n, largest)
    end
    return array
end


"""
    heap_sorting(array::Array{Int64,1})

As a comparison-based sorting algorithm, the heapsort algorithm (HSA) divides its input 
into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by 
extracting the largest element from it and inserting it into the sorted region. A specialty 
is that the HSA keeps the unsorted region in a heap data structure to find the largest 
element in each step more quickly. In more detail, in the first part of the HSA 
(while-loop), the largest value has to be found and set to position one. In the second part 
of the HSA (while-loop), the array's first and largest value has to be swap to the last 
index of the array, and the swapping-procedure starts again for a new interval n-1. For 
more information see: [https://en.wikipedia.org/wiki/Heapsort](https://en.wikipedia.org/wiki/Heapsort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.heap_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function heap_sorting(array::Array{Int64,1})
    # Base case. A array of zero or one elements is sorted, by definition.
    n = length(array)

    # Shrink the active space
    i = fld(n, 2)
    # Build a maxheap
    while i > 0
        array = heapify(array, n, i)
        i -= 1

    end

    # One by one extract elements 
    i = n
    while i > 1
        array[i], array[1] = array[1], array[i]
        # Julia specific reducing effectiv index
        array = heapify(array, i - 1, 1)
        i -= 1
    end

    return array
end




"""
    partition(array::Array{Int64,1}, low::Int64, high::Int64)

The partion algorithm is shuffeling the array for a given interval of low and high 
boundaries.


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `low::Int64`: Lowest index of the unsorted array or subarray
- `high::Int64`: Highes index of the unsorted array or subarray

"""
function partition(array::Array{Int64,1}, low::Int64, high::Int64)
    # index of smaller element
    i = low - 1
    # pivot         
    pivot = array[high]

    for j in low:high

        # If current element is smaller than the pivot 
        if array[j] < pivot

            # increment index of smaller element 
            i = i + 1
            # Swap if the element found is greater than the next element
            array[i], array[j] = array[j], array[i]
        end
    end
    array[i+1], array[high] = array[high], array[i+1]
    return (i + 1)
end

"""
    quick_sorting(array::Array{Int64,1}, low = nothing, high = nothing)

The quick sort algorithm (QSA) works by selecting a pivot element from the array and 
partitioning the other elements into two subarrays, according to whether they are less than 
or greater than the pivot-window. Then the sorting of subarrays is recursively organized. 
This procedure repeatedly happens until each subarray is organized; consequently, the 
subarrays' merging is an organized array. For more information see: 
[https://en.wikipedia.org/wiki/Quicksort#Parallelization](https://en.wikipedia.org/wiki/Quicksort#Parallelization)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `low::Int64`: Lowest index of the unsorted array or subarray
- `high::Int64`: Highes index of the unsorted array or subarray


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.quick_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function quick_sorting(array::Array{Int64,1}, low = nothing, high = nothing)
    # If nothing, then the intial run, so low and high are set to array size
    if isnothing(low) && isnothing(high)
        low = 1
        high = length(array)
    end
    if low < high

        # p_i is partitioning index, array[p_i] is now at right place 
        p_i = partition(array, low, high)

        # Separately sort elements before partition and after partition 
        array = quick_sorting(array, low, p_i - 1)
        array = quick_sorting(array, p_i + 1, high)
    else
        return array
    end
end
