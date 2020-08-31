module ClassicAlgorithmsCollections

include("NumberTheory.jl")
export modular_exponentiation
include("Graph.jl")
export breadth_first_search,
    depth_first_search,
    shortest_path_tree,
    graph_cycle_check,
    minimum_spanning_tree,
    graph_bridge_check
end # module
