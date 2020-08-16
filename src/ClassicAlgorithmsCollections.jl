module ClassicAlgorithmsCollections
export hello
"""
    hello(who::String)
Return "Hello, `who`".
"""
hello(who::String) = "Hello, $who"
include("NumberTheory.jl")

export modular_exponentiation
end # module
