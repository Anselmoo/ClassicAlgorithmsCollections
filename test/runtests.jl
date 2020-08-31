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

graph_cycle_true = Dict(1 => [2], 2 => [3], 3 => [1, 4])
@test ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_true) == true

graph_cycle_false = Dict(1 => [2], 2 => [5], 3 => [1, 4])
@test ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_false) == false

graph_with_spanning_tree =
    Dict(1 => [(2, 10), (3, 6), (4, 5)], 2 => [(4, 15)], 3 => [(4, 4)])
@test ClassicAlgorithmsCollections.minimum_spanning_tree(graph_with_spanning_tree) ==
      [3 4 4; 1 4 5; 1 2 10]

graph_bridge = Dict(1 => [2, 3, 4], 2 => [1, 3], 3 => [1, 2], 4 => [1, 5], 5 => [4])
@test ClassicAlgorithmsCollections.graph_bridge_check(graph_bridge) == [4 5; 1 4]
      
