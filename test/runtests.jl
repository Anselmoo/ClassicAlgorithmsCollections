using Test
using ClassicAlgorithmsCollections

@testset "Number Theory" begin
    # Tests for Number Theory
    @test ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15) == 8
end
@testset "Graph Theory" begin
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

    word_list = ["GEEKS", "FOR", "QUIZ", "GO"]
    graph_boogle = Dict(
        1 => ["G", "I", "Z"],
        2 => ["U", "E", "K"],
        3 => ["Q", "S", "E"],
        4 => ["D", "O", "P"],
        5 => ["F", "O", "R"],
    )

    @test ClassicAlgorithmsCollections.boogle_word_check(graph_boogle, word_list) ==
          ["GEEKS", "QUIZ", "FOR"]
end
@testset "Sorting & Searching" begin
    # Test for sorting and searching
    arr = [2, 3, 4, 10, 40]
    target = 10
    @test ClassicAlgorithmsCollections.binary_search(arr, target) == 4

    arr = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]
    target = 3
    @test ClassicAlgorithmsCollections.binary_pivot_search(arr, target) == 8

    arr = [64, 34, 25, 12, 22, 11, 90]
    ref = [11, 12, 22, 25, 34, 64, 90]
    @test ClassicAlgorithmsCollections.bubble_sorting(arr) == ref
    @test ClassicAlgorithmsCollections.insertion_sorting(arr) == ref
    @test ClassicAlgorithmsCollections.merge_sorting(arr) == ref

end
