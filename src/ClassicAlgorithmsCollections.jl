module ClassicAlgorithmsCollections

include("BitManipulation/CountTotalBits.jl")
export count_total_bits
include("BitManipulation/GetSingleInteger.jl")
export get_single_integer
include("BitManipulation/Integer2Binary.jl")
export int2binary
include("BitManipulation/MagicNumber.jl")
export magic_number
include("BitManipulation/MaximumXorSubarray.jl")
export maximum_xor_subarray
include("BitManipulation/SumOfBitDifference.jl")
export sum_of_bit_difference
include("BitManipulation/SwappingBits.jl")
export swapping_even_odd_bits

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
