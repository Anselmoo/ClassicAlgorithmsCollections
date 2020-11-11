
"""
    lcs_lenght(str_1::String, str_2::String)

The longest common subsequence (LCS) algorithm is dedicated to solve the problem of finding
the longest subsequence common to all sequences in a set of two sequences. For finding these
subsequences are brute force approach (permuation) has to be chosen as follow:
    
    1. Figure out the number of possible different subsequences of a string with length `len_1` and `len_2`.
    2. Recontracted `for-loops` for defining the outer layer of the storing matrix `C`.
    3. Checking if `str_1[i] == str_2[j]` and updating the count in  matrix `C`.
    4.Return the latest element of `C[len_1,len_2]`.
    
The **LCS** differs from the [longest common substring problem](https://en.wikipedia.org/wiki/Longest_common_substring_problem) because it is not required to occupy consecutive positions within the original sequences. 
For more information see: [https://en.wikipedia.org/wiki/Longest_common_subsequence_problem](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem)


# Arguments
- `str_1::String`: Graph of the connected nodes
- `str_2::String`: Startpoint (first selected vertex) of the graph-traveling process


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.lcs_lenght("AGGTAB","GXTXAYB")
4
```
"""
function lcs_lenght(str_1::String, str_2::String)
    len_1 = length(str_1)
    len_2 = length(str_2)
    C = zeros(Int64, (len_1, len_2))
    for i in 1:len_1
        C[i, 1] = 1
    end
    for j in 1:len_2
        C[1, j] = 1
    end
    for i in 2:len_1
        for j in 2:len_2
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
    return C[len_1, len_2]
end

