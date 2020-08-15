module NumberTheory

function power(x, y, p)
    res = 1     # Initialize result 
  
    # Update x if it is more 
    # than or equal to p 
    x = x % p  
      
    if (x == 0)  
        return 0
    end
  
    while (y > 0)  
          
        # If y is odd, multiply 
        # x with result 
        if ((y & 1) == 1)  
            res = (res * x) % p 
        end 
        # y must be even now 
        y = y >> 1      # y = y/2 
        x = (x * x) % p 
    end 

    return res 
end

end