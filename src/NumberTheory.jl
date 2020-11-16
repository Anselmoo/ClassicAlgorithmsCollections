"""
    modular_exponentiation(base::Int64, exponent::Int64, modulus::Int64)

Compute the `residuum` of the base raised to the `exponent`, which is divided by the
`modulus`.


# Arguments
- `base::Int64`: base
- `exponent::Int64`: exponent
- `modulus ::Int64`: modulus


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15)
8
```
"""
function modular_exponentiation(base::Int64, exponent::Int64, modulus::Int64)
    residuum = 1     # Initialize result

    # Update base if it is more
    # than or equal to modulus
    base = base % modulus

    if (base == 0)
        return 0
    end

    while (exponent > 0)

        # If exponent is odd, multiplexponent
        # base with result
        if ((exponent & 1) == 1)
            residuum = (residuum * base) % modulus
        end
        # exponent must be even now
        exponent = exponent >> 1      # exponent = exponent/2
        base = (base * base) % modulus
    end

    return residuum
end

"""
    modular_inverse(base::Int64, modulus::Int64)

Compute the multiplicative inverse of the `base` under the `modulus`.


# Arguments
- `base::Int64`: base
- `modulus ::Int64`: modulus


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.modular_inverse(3, 11)
4
```
"""
function modular_inverse(base::Int64, modulus::Int64)
    base = base % modulus
    for i in 1:modulus
        if (base * i) % modulus == 1
            return i
        end
    end
    return 1
end

"""
    euler_totient(n::Int64)

Compute the positive integers up to a given integer n that are relatively prime to n; also
known as Euler's totient. For more information see: [https://en.wikipedia.org/wiki/Euler%27s_totient_function](https://en.wikipedia.org/wiki/Euler%27s_totient_function)


# Arguments
- `n::Int64`: Number of elements


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.euler_totient(20)
[1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8, 8, 16, 6, 18, 8]
```
"""
function euler_totient(n::Int64)

    result = collect(Int64, 1:n)

    for i in 1:n
        m = i
        p = 2
        while m >= p^2
            if (m % p == 0)
                while (m % p == 0)
                    m = convert(Int64, m / p)
                end
                result[i] -= convert(Int64, result[i] / p)
            end
            p += 1
        end
        if m > 1
            result[i] -= convert(Int64, result[i] / m)
        end
    end
    return result
end

"""
    sieve_of_eratosthenes(n::Int64)

The Sieve of Eratosthenes is one of the historical algorithms dedicated to finding all
prime numbers up to any given limit. The algorithm is split into four steps:

1. Create a list of sequential integers from 2 to n.
2. Define initially `p=2` as the first prime number.
3. Reconstruct all multiple combinations from `p=2`.
4. Find the first number greater than p in the array that is not listed. Then decided:
	* If no number exists => stop. 
	* `p` becomes equal to the number and go back to step 3.

For more information see: [https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)


# Arguments
- `n::Int64`: Number of elements


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.sieve_of_eratosthenes(50)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
```
"""
function sieve_of_eratosthenes(n::Int64)
    prime = fill(true, n)
    p = 2
    while p^2 <= n


        if prime[p] == true

            # Update all multiples of p 
            for i in p^2:p:n
                prime[i] = false
            end

        end
        p += 1
    end
    result = zeros(Int64, count(prime) - 1)
    i = 1
    for p in 2:n
        if prime[p]
            result[i] = p
            i += 1
        end
    end
    return result
end

"""
    chinese_remainder_theorem(array::Array{Int64}, remainder::Array{Int64}))

The Chinese remainder theorem is based on simultaneous congruence. In more detail, if `x`
knows the `remainder` of the Euclidean division of an `array[i]` by several integers, then
`x` can determine the remainder of the division of `array[i]` by the product of these
integers uniquely, following the condition that the divisors are pairwise coprime. For more
information see: [https://en.wikipedia.org/wiki/Chinese_remainder_theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem)


# Arguments
- `array::Array{Int64}`: Array with elements.
- `remainder::Array{Int64}`: Number of elements


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> num = [3, 4, 5]
julia> rem = [2, 3, 1]
julia> ClassicAlgorithmsCollections.chinese_remainder_theorem(num, rem)
11
```
"""
function chinese_remainder_theorem(array::Array{Int64}, remainder::Array{Int64})
    x = 1
    n = length(array)
    while true
        i = 1
        while j < n
            if x % array[i] != remainder[i]
                break
            end
            i += 1
        end
        if i == n
            return x
        end
        x += 1
    end
end
