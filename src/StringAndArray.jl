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
    count_triplet_elements(array::Array{Int64,1}, sum::Int64)

Counting the number of three elements in the array, which sum is equal to the reference sum.


# Arguments
- `array::Array{Int64,1}`: Unsorted array
- `array::Array{Int64,1}`: Refernece sum


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 7]
julia> sum = 12
julia> ClassicAlgorithmsCollections.count_triplet_elements(arr, sum)
2


# Notes:
---

This should be implemented recursively instead of using three for-loops because it will
allow using any conditions.

"""
function count_triplet_elements(array::Array{Int64,1}, sum::Int64)

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


"""
    count_pythagorean_elements(array::Array{Int64,1})

Counting the number of `Pythagorean`-elements in the array, which sum is equal to
A^2 + B^2 = C^2.


# Arguments
- `array::Array{Int64,1}`: Unsorted array

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13 ,12]
julia> ClassicAlgorithmsCollections.count_pythagorean_elements(arr, sum)
3
"""
function count_pythagorean_elements(array::Array{Int64,1})

    # Initialize result
    ans = 0
    n = length(array)

    for i in 1:n-2
        for j in i+1:n-1
            for k in j+1:n
                AA = array[i]^2
                BB = array[j]^2
                CC = array[k]^2
                if (AA + BB == CC)
                    ans += 1
                elseif (AA + CC == BB)
                    ans += 1
                elseif (BB + CC == AA)
                    ans += 1
                end
            end
        end
    end
    return ans
end

function generate_array(
    array_1::Array{Int64},
    array_2::Array{Int64},
    array_merged::Array{Int64},
    i::Int64,
    j::Int64,
    k::Int64,
    l::Int64,
    size::Int64,
    flag::Bool,
    result
)
    if flag
        if size > 1

            println(array_merged[1:size])


        end
        for m in i:k
            if size < 2
                array_merged[size] = array_1[m]
                generate_array(array_1,
                array_2, array_merged, m + 1, j, k, l, size, !flag,
                result)
            else
                if array_1[m] > array_merged[size]
                    array_merged[size+1] = array_1[m]
                    generate_array(
                        array_1,
                        array_2,
                        array_merged,
                        m + 1,
                        j,
                        k,
                        l,
                        size + 1,
                        !flag,result
                    )
                end
            end
        end

    else
        for n in j:l
            if array_2[n] > array_merged[size]
                array_merged[size+1] = array_2[n]
                generate_array(
                    array_1,
                    array_2,
                    array_merged,
                    i,
                    n + 1,
                    k,
                    l,
                    size + 1,
                    !flag,result
                )

            end
        end

    end
    return result
end

"""
    combinations_of_2arrays(array_1::Array{Int64,1}, array_2::Array{Int64,1}))

Provides all combinations of sorted arrays with an increasing number of elements. Original
idea


# Arguments
- `array::Array{Int64,1}`: Unsorted array

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13 ,12]
julia> ClassicAlgorithmsCollections.count_pythagorean_elements(arr, sum)
3
"""
function combinations_of_2arrays(array_1::Array{Int64,1}, array_2::Array{Int64,1})
    length_array_1,  length_array_2 = length(array_1),  length(array_2)
    init_array = zeros(Int64, (length_array_1 +  length_array_2))
     # Create array-list for the searching solution
    result =zeros(Int64, (false,false))
    return generate_array(
        array_1,
        array_2,
        init_array,
        1,
        1,
        length_array_1,  length_array_2,
        1,
        true,
        result
    )

end

B = [10, 15, 25]
A = [5, 20, 30]
combinations_of_2arrays(A, B)