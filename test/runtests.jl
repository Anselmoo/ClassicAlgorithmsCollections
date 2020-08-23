using Test
using ClassicAlgorithmsCollections

# Tests for Number Theory
@test ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15) === 8

# Tests for Graph Theory
graph = Dict(1 => [2, 3], 2 => [3], 3 => [1, 4], 4 => [4])
@test ClassicAlgorithmsCollections.breadth_first_search(graph, 3) == [3, 1, 4, 2]
@test ClassicAlgorithmsCollections.depth_first_search(graph, 3) == [3, 1, 2, 4]

graph_with_weights_1 =
    Dict(1 => [(3, -2)], 2 => [(1, 4), (3, 3)], 3 => [(4, 2)], 4 => [(2, -1)])
@test ClassicAlgorithmsCollections.shortest_path_tree(graph_with_weights_1, 2, 4) ==
      ([0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 1 0], [2, 1, 3, 4])

graph_with_weights_2 =
    Dict(1 => [(3, -2)], 2 => [(1, 4), (3, 3)], 3 => [(4, 2)], 4 => [(2, -1), (3, -1)])

@test ClassicAlgorithmsCollections.shortest_path_tree(graph_with_weights_2) ==
      [0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 -1 0]
