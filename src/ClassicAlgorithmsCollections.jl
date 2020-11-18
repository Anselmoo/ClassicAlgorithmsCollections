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

include("Graph/BoogleWordCheck.jl")
export boogle_word_check
include("Graph/BreadthFirstSearch.jl")
export breadth_first_search
include("Graph/DepthFirstSearch.jl")
export depth_first_search
include("Graph/GraphBridgeCheck.jl")
export graph_bridge_check
include("Graph/GraphCycleCheck.jl")
export graph_cycle_check
include("Graph/MinimumSpanningTree.jl")
export minimum_spanning_tree
include("Graph/ShortestPathTree.jl")
export shortest_path_tree



include("NumberTheory/ChineseRemainderTheorem.jl")
export chinese_remainder_theorem
include("NumberTheory/EulerTotient.jl")
export euler_totient
include("NumberTheory/ModularExponentiation.jl")
export modular_exponentiation
include("NumberTheory/ModularInverse.jl")
export modular_inverse
include("NumberTheory/SieveOfEratosthenes.jl")
export sieve_of_eratosthenes

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
