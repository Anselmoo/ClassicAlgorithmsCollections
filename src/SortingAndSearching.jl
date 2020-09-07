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

The merge algorithms (MA) merge the sublists `left` and `right` to produce new sorted 
sublists until there is only one sublist remaining, which will be the sorted list. For more 
information see: https://en.wikipedia.org/wiki/Merge_sort

...
# Arguments
- `left::Array{Int64,1}`: Unsorted left part of the array
- `right::Array{Int64,1}`: Unsorted right part of the array
...
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
recursively splits the list into sublists until the sublist size is < 2, merging those 
sublists to produce a sorted list by using a new function `merge`. The back copying is 
blocked by alternating the direction of the merge with each recursion. For more information 
see: https://en.wikipedia.org/wiki/Merge_sort

...
# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
...

# Examples
```julia-repl
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.merge_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function merge_sorting(array::Array{Int64,1})
    # Base case. A list of zero or one elements is sorted, by definition.
    n = length(array)
    if n < 2
        return array
    end

    # First, divide the list into equal-sized sublists
    mid = fld(n, 2)
    left = array[1:mid]
    right = array[mid+1:n]
    # Recursively sorting the left and right half
    left = merge_sorting(left)
    right = merge_sorting(right)
    # Then merge the now-sorted left and right sublists.
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

...
# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `n::Int64`: Length of the array
- `::Int64`: Current index of the array
...
"""
function heapify(array::Array{Int64,1}, n::Int64, i::Int64)
    # Initialize largest as root and left and right sublists
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
of the HSA (while-loop), the list's first and largest value has to be swap to the last 
index of the array, and the swapping-procedure starts again for a new interval n-1. For 
more information see: https://en.wikipedia.org/wiki/Heapsort

...
# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
...

# Examples
```julia-repl
julia> arr = [64, 34, 25, 12, 22, 11, 90] 
julia> ClassicAlgorithmsCollections.heap_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function heap_sorting(array::Array{Int64,1})
    # Base case. A list of zero or one elements is sorted, by definition.
    n = length(array)
    # Build a maxheap. 
    i = fld(n, 2)
    while i > 0
        array = heapify(array, n, i)
        i -= 1

    end
    # [90, 34, 64, 12, 22, 11, 25
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
