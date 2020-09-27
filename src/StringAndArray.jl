"""
    reverse_pure_string(text::String)

Reverse only the non-special characters (alphabet: 'a', to 'z' and 'A' to 'Z') and letting 
the rest untouched. For this purpose, `reverse_pure_string` is scanning through the string 
as an array, and if the current character is not special, it will reverse the elements by 
swapping; vice versa, if the current character is a special element, the boundaries will be 
modified.

# Arguments
- `text::String`: String with special character like !,<#


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> string = "a!!!b.c79.d,e'f,ghi3###""
julia> ClassicAlgorithmsCollectionsreverse_pure_string(string)
"a!!!b.c79.d,e'f,ghi3###""
"""
function reverse_pure_string(text::String)
    low = 1
    high = sizeof(text)

    text_array = collect(text)
    while low < high
        # Check if lower char is special character and change the boundary
        if !isletter(text_array[low])
            low += 1
            # Check if higher char is special character and change the boundary
        elseif !isletter(text_array[high])
            high -= 1
        else
            # Reverse the string by swapping
            text_array[low], text_array[high] = text_array[high], text_array[low]
            low += 1
            high -= 1

        end
    end
    return join(text_array)
end


"""
    zigzag_ordering(array::Array{Int64,1})

`zigzag_ordering` reorders an unsorted array in the zigzag fashion. This procedure implies 
that between every second step a break will be generated by switching the `flag-boolean`.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [4, 3, 7, 8, 6, 2, 1, 10, 13, 3]
julia> ClassicAlgorithmsCollections.zigzag_ordering(arr)
[3, 7, 4, 8, 2, 6, 1, 13, 3, 10]
"""
function zigzag_ordering(array::Array{Int64,1})
    # Intialize the flag
    flag = true
    for i in 1:length(array)-1
        # If flag is true, then check if next array element is greater than previous
        if flag
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
            end
            # If flag is true, then check if next array element is smaller than previous
        else
            if array[i] < array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
            end
        end
        # Swapt the flag after every turn
        flag = !flag
    end
    return array
end





"""
    count_triplet_elments(array::Array{Int64,1}, sum::Int64)

Counting the number of three elements in the array, which sum is equal to the reference sum.


# Arguments
- `array::Array{Int64,1}`: Unsorted array
- `array::Array{Int64,1}`: Refernece sum


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 7]
julia> sum = 12
julia> ClassicAlgorithmsCollections.count_triplet_elments(arr, sum)
2


# Notes:
---

This should be implemented recursively instead of using three for-loops because it will 
allow using any conditions.

"""
function count_triplet_elments(array::Array{Int64,1}, sum::Int64)

    # Initialize result 
    ans = 0
    n = length(array)

    for i in 1:n-2
        for j in i+1:n-1
            for k in j+1:n
                if (array[i] + array[j] + array[k] == sum)
                    ans += 1
                end
            end
        end
    end
    return ans
end




