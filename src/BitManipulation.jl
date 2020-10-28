"""
    maximum_xor_subarray(array::Array{Int64,1})

For finding the maximum XOR value of a subarray by running two nested for-loops. The first
for-loop is intializing the current XOR value, the second for-loop is generating the [BIT-XOR](https://en.wikipedia.org/wiki/Bitwise_operation#XOR)
and compared the current value with the temporary largest value.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13 ,12]
julia> ClassicAlgorithmsCollections.count_pythagorean_elements(arr, sum)
    3
```
"""
function maximum_xor_subarray(array::Array{Int64,1})
    result = -21345944
    n = length(array)

    for i in 1:n
        curr_xor = 0
        for j in i:n
            curr_xor = curr_xor ⊻ array[j]
            if result < curr_xor
                result = curr_xor
            end
        end
    end
    return result
end

"""
    magic_number(n::Int64))

A magic number has to build as the power of 5 or the sum of unique powers of 5. First few
magic numbers are:
    1. 5 
    2. 5^2 = 25
    3. 5 + 25 = 30
    4. 5^3 = 125
    5. 125 + 5 = 130


# Arguments
- `n::Int64`: Integer value of the number, which has to become a magic number


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.magic_number(5)
    130
```
"""
function magic_number(n::Int64)

    pow = 1
    result = 0

    while n != 0
        pow *= 5
        if n & 1 % Bool
            result += pow
        end
        n >>= 1
    end
    return result
end