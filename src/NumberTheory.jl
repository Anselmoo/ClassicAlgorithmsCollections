"""
    modular_exponentiation(base::Int, exponent::Int, modulus::Int)

Compute the residuum of the base raised to the exponent, which is divided by the modulus.


...
# Arguments
- `base::Integer`: base
- `exponent::Integer`: exponent
- `modulus ::Integer`: modulus
...

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15)
8
```
"""
function modular_exponentiation(base::Int, exponent::Int, modulus::Int)
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
