module ClassicAlgorithmsCollections

include("BitManipulation.jl")
export maximum_xor_subarray,
    magic_number,
    sum_of_bit_difference,
    swapping_even_odd_bits,
    get_single_integer,
    int2binary,
    count_total_bits

include("DynamicProgramming.jl")
export lcs_length,
    lis_length, minumum_operations, number_of_steps, subset_sum_test, knapsack_solver

include("Graph.jl")
export breadth_first_search,
    depth_first_search,
    shortest_path_tree,
    graph_cycle_check,
    minimum_spanning_tree,
    graph_bridge_check,
    boogle_word_check

include("NumberTheory.jl")
export modular_exponentiation, modular_inverse

include("SortingAndSearching.jl")
export binary_search,
    binary_pivot_search,
    bubble_sorting,
    insertion_sorting,
    merge_sorting,
    heap_sorting,
    quick_sorting,
    interpolation_searching,
    closest_pair_searching

include("StringAndArray.jl")
export reverse_pure_string,
    zigzag_ordering,
    count_triplet_elements,
    count_pythagorean_elements,
    combinations_of_2arrays,
    find_maxlength_subarray,
    find_smallest_nonelement,
    smallest_subset4sum,
    sum_of_postive_gradients


end # module
