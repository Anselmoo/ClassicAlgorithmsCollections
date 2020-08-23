using Test
using ClassicAlgorithmsCollections

# Tests for Number Theory
@test ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15) === 8

# Tests for Graph Theory
graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])
@test ClassicAlgorithmsCollections.breadth_first_search(graph, 3) == [3, 1, 4, 2]
@test ClassicAlgorithmsCollections.depth_first_search(graph, 3) == [3, 1, 2, 4]