
"""
    lcs_length(str_1::String, str_2::String)

The longest common subsequence (LCS) algorithm is dedicated to solve the problem of finding
the longest subsequence common to all sequences in a set of two sequences. For finding these
subsequences are brute force approach (permuation) has to be chosen as follow:
    
    1. Figure out the number of possible different subsequences of a string with length `m` and `n`.
    2. Recontracted `for-loops` for defining the outer layer of the storing matrix `C`.
    3. Checking if `str_1[i] == str_2[j]` and updating the count in  matrix `C`.
    4.Return the latest element of `C[m,n]`.
    
The **LCS** differs from the [longest common substring problem](https://en.wikipedia.org/wiki/Longest_common_substring_problem) because it is not required to occupy consecutive positions within the original sequences. 
For more information see: [https://en.wikipedia.org/wiki/Longest_common_subsequence_problem](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem)


# Arguments
- `str_1::String`: String 1 of length `m`
- `str_2::String`: String 2 of length `n`


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.lcs_lenght("AGGTAB","GXTXAYB")
4
```
"""
function lcs_length(str_1::String, str_2::String)
    m = length(str_1)
    n = length(str_2)
    C = zeros(Int64, (m, n))
    for i in 1:m
        C[i, 1] = 1
    end
    for j in 1:n
        C[1, j] = 1
    end
    for i in 2:m
        for j in 2:n
            if str_1[i] == str_2[j]
                C[i, j] = C[i-1, j-1] + 1
            else
                if C[i, j-1] > C[i-1, j]
                    C[i, j] = C[i, j-1]
                else
                    C[i, j] = C[i-1, j]
                end
            end
        end
    end
    return C[m, n]
end

"""
    lis_length(str_1::String, str_2::String)

The longest increasing subsequence (LIS) algorithm is dedicated to finding the longest
increasing subsequence for a given array.  This subsequence does not have to be contiguous
or unique. 
    
    1. Figure out the number of possible different subsequences of a string with length `m` and `n`.
    2. Recontracted `for-loops` for defining the outer layer of the storing matrix `C`.
    3. Checking if `str_1[i] == str_2[j]` and updating the count in  matrix `C`.
    4.Return the latest element of `C[m,n]`.
    
For more information see: [https://en.wikipedia.org/wiki/Longest_increasing_subsequence](https://en.wikipedia.org/wiki/Longest_increasing_subsequence)


# Arguments
- `array::Array{Int64,1}`: array of integers unsortetd or sorted


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10, 22, 9, 33, 21, 50, 41, 60] 
julia> ClassicAlgorithmsCollections.lis_length(arr)
4
```
"""
function lis_length(array::Array{Int64,1})
    n = length(array)
    list = fill(1, n)
    for i in 2:n
        for j in 1:i
            if array[i] > array[j] && list[i] < list[j] + 1
                list[i] = list[j] + 1
            end
        end
    end

    result = 0
    for i in 1:n
        if list[i] > result
            result = list[i]
        end
    end
    return result
end

"""
    minumum_operations(str_1::String, str_2::String)

The minimum operations algorithm explores how many string edits (`insert`, `remove`,
`replace`) are needed to convert str_1 to str_2.


# Arguments
- `str_1::String`: String 1 of length `m`
- `str_2::String`: String 2 of length `n`

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> str1 = "sunday"
julia> str2 = "saturday"
julia> ClassicAlgorithmsCollections.minumum_operations(str1,str2)
3
```
"""
function minumum_operations(str_1::String, str_2::String)
    m = length(str_1)
    n = length(str_2)
    if m == 1
        return n
    end
    if n == 1
        return m
    end

    if str_1[m] == str_2[n]
        return minumum_operations(str_1[1:m-1], str_2[1:n-1])
    end

    insert = minumum_operations(str_1[1:m], str_2[1:n-1])
    remove = minumum_operations(str_1[1:m-1], str_2[1:n])
    replace = minumum_operations(str_1[1:m-1], str_2[1:n-1])

    if insert < remove < replace || insert < replace < remove
        return insert
    elseif remove < insert < replace || remove < replace < insert
        return remove
    end
    return replace
end

"""
    number_of_steps(distance::Int64, step_size::Int64)

Number of step_size is calculating the total number of combinations for walking a `distance`
for a given number of step_size. For example, for a `distance` of 3 with a maximum
`step_size` of 3 will provide for possible combinations:

    - 1 step + 1 step + 1 step
    - 1 step + 2 step
    - 2 step + 1 step
    - 3 step

# Arguments
- `distance::Int64`: Distance to go
- `step_size::Int64`: Maximum step size of walking a distance


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.number_of_steps(8,3)
81
```
"""
function number_of_steps(distance::Int64, step_size::Int64)

    if distance < 0
        return 0
    end
    if distance == 0
        return 1
    end
    result = 0
    for i in 1:step_size
        result += number_of_steps(distance - i, step_size)
    end
    return result
end


"""
    subset_sum_test(array::Array{Int64,1}, target::Int64)

The recursive expression tests if there is a subset in the array, where the sum of the
subset is equal to the `target`.
    

# Arguments
- `array::Array{Int64,1}`: Array with a possible sum of a subsequence.
- `target::Int64`: Target sum of the subsequence, which should be included in the array.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> set = [3, 34, 4, 12, 5, 2]
julia> sum = 9
julia> ClassicAlgorithmsCollections.subset_sum_test(set, sum)
true
```
"""
function subset_sum_test(array::Array{Int64,1}, target::Int64)
    n = length(array)
    if target == 1
        return true
    end
    if n == 1
        return false
    end
    if array[n-1] > target
        return subset_sum_testt(array[1:n-1], target)
    end

    return subset_sum_testt(array[1:n-1], target) ||
           subset_sum_testt(array[1:n-1], target - array[n-1])
end
