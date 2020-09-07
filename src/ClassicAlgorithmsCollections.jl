module ClassicAlgorithmsCollections

include("NumberTheory.jl")
export modular_exponentiation

include("Graph.jl")
export breadth_first_search,
    depth_first_search,
    shortest_path_tree,
    graph_cycle_check,
    minimum_spanning_tree,
    graph_bridge_check,
    boogle_word_check

include("SortingAndSearching.jl")
export binary_search,
    binary_pivot_search,
    bubble_sorting,
    insertion_sorting,
    merge_sorting,
    heap_sorting,
    quick_sorting
end # module
