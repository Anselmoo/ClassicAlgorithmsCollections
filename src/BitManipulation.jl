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
julia> arr = [8, 1, 2, 12, 45, 100, 43]
julia> ClassicAlgorithmsCollections.maximum_xor_subarray(arr)
110
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

"""
    sum_of_bit_difference(array::Array{Int64,1})

For finding the sum of bit differences in all pairs of an array, the array will be
transformed into a series of subarrays  for a given bit-length.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [8, 1, 2, 12, 45, 100, 43]
julia> ClassicAlgorithmsCollections.maximum_xor_subarray(arr)
104
```
"""
function sum_of_bit_difference(array::Array{Int64,1}, bit = 32)
    n = length(array)
    result = 0
    for i in 1:bit
        count = 0
        for j in 1:n
            if (array[j] & (1 << i)) != 0
                count += 1
            end
        end
        result += count * (n - count) * 2
    end
    return result
end


"""
    swapping_even_odd_bits(n::Int64))

For a given integer value, all odd bits will be swapped with even bits.


# Arguments
- `n::Int64`: Integer value of the number, which has to be swapped.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.function swapping_even_odd_bits(23)
43
```


# Notes
---
The definition of the even and odd bits:
```julia-repl
even_bits = n & 0xAAAAAAAA
odd_bits = n & 0x55555555
```
"""
function swapping_even_odd_bits(n::Int64)
    # Defining even and odd bits
    even_bits = n & 0xAAAAAAAA
    odd_bits = n & 0x55555555

    # Shifting the even and odd bits
    even_bits >>= 1
    odd_bits <<= 1
    return (even_bits | odd_bits)
end


"""
    get_single_integer(array::Array{Int64,1})

For finding the single element in an array, where every other elements appear three times.


# Arguments
- `array::Array{Int64,1}`: Unsorted array with threetimes elements and one single element.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [12, 1, 12, 3, 12, 1, 1, 2, 3, 3]
julia> ClassicAlgorithmsCollections.get_single_integer(arr)
2
```
"""
function get_single_integer(array::Array{Int64,1})
    first_appear_bits = 0
    second_appear_bits = 0

    for i in 1:length(array)
        second_appear_bits = second_appear_bits | (first_appear_bits & array[i])
        first_appear_bits = first_appear_bits ⊻ array[i]
        # Third times appearing bit
        third_appear_bits = ~(first_appear_bits & second_appear_bits)
        first_appear_bits &= third_appear_bits
        second_appear_bits &= third_appear_bits
    end
    return first_appear_bits
end

"""
    int2binary(n::Int64, array=zeros(Int64,0))

Converts any integer to a binary representation as initiger array with 0, 1.


# Arguments
- `n::Int64`: Integer value which has to be converted
- `array=zeros(Int64,0)`: Empty array for return


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.int2binary(131)
([1,0,0,0,0,0,1,1],1)
```
"""
function int2binary(n::Int64, array = zeros(Int64, 0))
    if n > 1
        int2binary(n >> 1, array)
    end
    n &= 1
    append!(array, n)
    return array, n
end


"""
    count_total_bits(n::Int64)

Calculates the total number of bits from 1 to `n` for a given integer `n` by combing a 
while-loop for building the binary subsets with a range for-loop for counting the bits.


# Arguments
- `n::Int64`: Integer value which has to be evaluated.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.count_total_bits(17)
35
```
"""
function count_total_bits(n::Int64)

    i = 0
    result = 0

    while n > (1 << i)

        k =0
        change = 1 << i

        for _ in 1:n+1
            result += k

            if change == 1
                # Flipping the bit
                if k == 0
                    k = 1
                else
                    k = 0
                end
                change = 1 << i 
  
            else 
                change -= 1
            end
        end
        i += 1

    end
    return result
end

