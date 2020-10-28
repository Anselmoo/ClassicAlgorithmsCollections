using Test
using ClassicAlgorithmsCollections

@testset "BIT Manipulation" begin
    # Tests for BIT Manipulation
    arr = [8, 1, 2, 12, 45, 100, 43]
    @test ClassicAlgorithmsCollections.maximum_xor_subarray(arr) == 110
    @test ClassicAlgorithmsCollections.magic_number(5) == 130
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


@testset "Number Theory" begin
    # Tests for Number Theory
    @test ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15) == 8
end


@testset "Sorting & Searching" begin
    # Test for sorting and searching
    array_sorting = [64, 34, 25, 12, 22, 11, 90]
    ref_sorting = [11, 12, 22, 25, 34, 64, 90]
    @test ClassicAlgorithmsCollections.bubble_sorting(array_sorting) == ref_sorting
    @test ClassicAlgorithmsCollections.insertion_sorting(array_sorting) == ref_sorting
    @test ClassicAlgorithmsCollections.merge_sorting(array_sorting) == ref_sorting
    @test ClassicAlgorithmsCollections.heap_sorting(array_sorting) == ref_sorting
    @test ClassicAlgorithmsCollections.quick_sorting(array_sorting) == ref_sorting

    array_searching = [10, 11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
    target_searching = 12
    ref_searching = 3
    @test ClassicAlgorithmsCollections.binary_search(array_searching, target_searching) ==
          ref_searching
    @test ClassicAlgorithmsCollections.interpolation_searching(
        array_searching,
        target_searching,
    ) == ref_searching

    array_searching_pair = [10, 22, 28, 29, 30, 40]
    target_searching_pair = 56
    ref_searching_pair = (28, 29)
    @test ClassicAlgorithmsCollections.closest_pair_searching(
        array_searching_pair,
        target_searching_pair,
    ) == ref_searching_pair

    array_unsorted_searching = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]
    target_unsorted_searching = 3
    ref_unsorted_searching = 8
    @test ClassicAlgorithmsCollections.binary_pivot_search(
        array_unsorted_searching,
        target_unsorted_searching,
    ) == ref_unsorted_searching
end

@testset "String & Array" begin
    old_string = "a!!!b.c79.d,e'f,ghi3###"
    reversed_string = "i!!!h.g79.f,e'd,cba3###"
    @test ClassicAlgorithmsCollections.reverse_pure_string(old_string) == reversed_string

    array_before_zigzag = [4, 3, 7, 8, 6, 2, 1, 10, 13, 3]
    array_after_zigzag = [3, 7, 4, 8, 2, 6, 1, 13, 3, 10]
    @test ClassicAlgorithmsCollections.zigzag_ordering(array_before_zigzag) ==
          array_after_zigzag


    arr = [5, 1, 3, 4, 7]
    sum = 12
    @test ClassicAlgorithmsCollections.count_triplet_elements(arr, sum) == 2

    array_pythagorean = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13, 12]
    @test ClassicAlgorithmsCollections.count_pythagorean_elements(array_pythagorean) == 3


    arr_1 = [10, 15, 25]
    arr_2 = [5, 20, 30]
    sorted_combinations = [
        [10, 20],
        [10, 20, 25, 30],
        [10, 30],
        [15, 20],
        [15, 20, 25, 30],
        [15, 30],
        [25, 30],
    ]
    @test ClassicAlgorithmsCollections.combinations_of_2arrays(arr_1, arr_2) ==
          sorted_combinations
    subarray_in_array = [10, 12, 11, 9, 13, 14, 17, 18, 15]
    @test ClassicAlgorithmsCollections.find_maxlength_subarray(subarray_in_array) == 5

    @test ClassicAlgorithmsCollections.smallest_subset4sum(subarray_in_array, 52) == 4
    @test ClassicAlgorithmsCollections.smallest_subset4sum(subarray_in_array, 2) == 1
    @test ClassicAlgorithmsCollections.smallest_subset4sum(subarray_in_array, 5555) ==
          nothing

    sort_array = [1, 2, 5, 10, 20, 40]
    @test ClassicAlgorithmsCollections.find_smallest_nonelement(sort_array) == 4

    gradients_in_array = [100, 180, 260, 310, 40, 535, 695]
    @test ClassicAlgorithmsCollections.sum_of_postive_gradients(gradients_in_array) == 865
end