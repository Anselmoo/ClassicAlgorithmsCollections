using Test
using ClassicAlgorithmsCollections

@test ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15) === 8


# 0: [1, 2], 1: [2], 2: [0, 3], 3: [3]}  -> 2 0 3 1
graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])
@test ClassicAlgorithmsCollections.breadth_first_search(graph, 3) == [3, 1, 4, 2]