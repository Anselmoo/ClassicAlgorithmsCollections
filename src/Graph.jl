"""

    find_global_maximum(graph::Dict{Int64,Array{Int64,1}})

Find the total global maximum based on a comparsion between the intial vertex 
(`global_maximum = 0`), the current dictionary key, and the accesible vertexes from 
the array-list (value).

...
# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
...
"""
function find_global_maximum(graph::Dict{Int64,Array{Int64,1}})
    global_maximum = 0
    # Going through the dictionary
    for (key, value) in graph
        # Check the keys as new global maximum
        if key > global_maximum
            global_maximum = key
        end
        # Check the values as new local maximum
        local_maximum = maximum(value)
        # Check if new local maximum becomes global maximum
        if local_maximum > global_maximum
            global_maximum = local_maximum
        end
    end
    return global_maximum
end

"""

    find_global_maximum_complex(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})

`find_global_maximum_complex` is similar to `find_global_maximum` instead is desigend 
for handling graphs with weights.    
    
...
# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with weights
...
"""
function find_global_maximum_complex(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    global_maximum = 0
    # Going through the dictionary
    for (key, value) in graph
        # Check the keys as new global maximum
        if key > global_maximum
            global_maximum = key
        end
        # Check the values as new local maximum
        for local_maximum in value
            # Check if new local maximum becomes global maximum
            if local_maximum[1] > global_maximum
                global_maximum = local_maximum[1]
            end

        end

    end
    return global_maximum
end

"""
    breadth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

The breadth-first search (BFS) is an algorithm dedicated to traversing or searching for 
tree or graph data structures. It starts at a specified tree root (start) for exploring 
all connected neighbor nodes. The important feature is that the BFS automatically leaves 
the present depth and passes on to the next nodes at a deeper level. BFS is queue-based.
For more information see: https://en.wikipedia.org/wiki/Breadth-first_search

...
# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint (first selected vertex) of the graph-traveling process
...

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])
julia> ClassicAlgorithmsCollections.breadth_first_search(graph, 3)
[3, 1, 4, 2]
```
"""
function breadth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

    # Mark all the vertices as not visited 
    # visited = zeros(Bool, (length(collect(keys(graph))))) # Old
    visited = zeros(Bool, (find_global_maximum(graph)))

    # Create a queue for BFS 
    queue = zeros(Int64, false)

    # Create array-list for the searching solution 
    solution = zeros(Int64, false)

    # Mark the source node as visited and enqueue it 
    visited[start] = true
    append!(queue, start)

    while !isempty(queue)

        # Dequeue a vertex from  
        # queue and print it 
        start = popat!(queue, 1)
        append!(solution, start)
        # Get all adjacent vertices of the dequeued vertex s. If a adjacent 
        # has not been visited, then mark it visited and enqueue it 
        for i in graph[start]
            if visited[i] == false
                append!(queue, i)
                visited[i] = true
            end
        end
    end
    return solution
end

"""
    dfs_recrusive(
        graph::Dict{Int64,Array{Int64,1}},
        start::Int64,
        visited::Array{Bool,1},
        solution::Array{Int64,1},
    )

The recursively call of the dfs_recrusive is essential for exploring each single branch 
of the graph.

...
# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint (first selected vertex) of the graph-traveling process
- `visited::Array{Bool,1}`: Visited nodes of the graph
- `solution::Array{Int64,1}`: Solution of the raph-traveling proces
...

"""
function dfs_recrusive(
    graph::Dict{Int64,Array{Int64,1}},
    start::Int64,
    visited::Array{Bool,1},
    solution::Array{Int64,1},
)
    # Mark the current node as visited and enqueue it
    visited[start] = true
    append!(solution, start)

    # Recur for all the vertices adjacent to this vertex
    for i in graph[start]
        if visited[i] == false
            dfs_recrusive(graph, i, visited, solution)
        end
    end
    return solution

end

"""
    depth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

The depth-first search (DFS) is an algorithm dedicated to traversing or searching for 
tree or graph data structures. It starts at a specified tree root (start) for exploring 
as far as possible at each branch. Afterthat the BFS starts automatically backtracking. 
DFS is stack-based. 
For more information see: https://en.wikipedia.org/wiki/Depth-first_search

...
# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint (first selected vertex) of the graph-traveling process
...

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])
julia> ClassicAlgorithmsCollections.breadth_first_search(graph, 3)
[3, 1, 2, 4]
```
"""
function depth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

    # Mark all the vertices as not visited 
    # visited = zeros(Bool, (length(collect(keys(graph))))) # Old
    visited = zeros(Bool, (find_global_maximum(graph)))

    # Create array-list for the searching solution 
    solution = zeros(Int64, false)

    result = dfs_recrusive(graph, start, visited, solution)
    return result
end

"""
    initialize_matrices(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})

Initialize the matrices for distances and pathes.

...
# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with weights
...
"""
function initialize_matrices(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    # Define intial infinity weight & next matrix for given data type
    vertex_size = find_global_maximum_complex(graph)
    dist = fill(99999, (vertex_size, vertex_size))
    next = zeros(Int64, (vertex_size, vertex_size))

    # Updating the matrix with actual vertex values
    for (key, elements) in graph
        # Setting the diagonal-elements of the weight matrix to 0
        dist[key, key] = 0
        # Setting the diagonal-elements of the next matrix to vertex
        next[key, key] = key
        # Weigthing of the edges and pathes
        for value in elements
            dist[key, value[1]] = value[2]
            next[key, value[1]] = value[1]
        end
    end
    return dist, next, vertex_size
end

"""
    path_reconstruction(next::Array{Int64,2}, u::Int64, v::Int64)

Reconstruction of the actual path between any two endpoint vertices (u & v).
...
# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with weights
- `u::Int64`: Startpoint of the to investigated path
- `v::Int64`: Endpoint of the to investigated path
...
"""
function path_reconstruction(next::Array{Int64,2}, u::Int64, v::Int64)
    # Check if path exists
    if next[u, v] == 0
        return zeros(Int64, false)
    end

    # Initialize path
    path = [u]

    while u != v
        u = next[u, v]
        append!(path, u)
    end
    return path
end

"""
    shortest_path_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}, u=nothing, v=nothing)

The Shortest Path Tree (SPT) algorithm solves the shortest path problem between every 
pair of vertices in a given edge-weighted directed Graph based on the Floyd–Warshall 
algorithm. Optional, the SPT also provides the total parts between a start- (u) and end-
point (v). For more information see: https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm

# Arguments
- `next::Array{Int64,2}`: Vertex matrix of the connected nodes
- `u::Int64`: Startpoint of the to investigated path; optional
- `v::Int64`: Endpoint of the to investigated path; optional

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = Dict( 1 => [(3, -2)], 2 => [(1, 4),(3, 3)], 3 => [(4, 2)], 4 => [(2, -1)]
julia> ClassicAlgorithmsCollections.shortest_path_tree(graph, 2, 4)
([0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 1 0], [2, 1, 3, 4])
```
"""
function shortest_path_tree(
    graph::Dict{Int64,Array{Tuple{Int64,Int64},1}},
    u = nothing,
    v = nothing,
)

    dist, next, vertex_size = initialize_matrices(graph)

    # Floyd–Warshall-Algorithm 
    for k in 1:vertex_size
        for i in 1:vertex_size
            for j in 1:vertex_size
                # Checking for minimum
                if dist[i, j] > dist[i, k] + dist[k, j]
                    # Add new distance
                    dist[i, j] = dist[i, k] + dist[k, j]
                    # Add new path points
                    next[i, j] = next[i, k]
                end
            end
        end
    end

    # Path-Reconstruction
    if !(isnothing(u) & isnothing(v))
        return dist, path_reconstruction(next, u, v)
    else
        return dist
    end
end


"""
    find_parent(parent::Array{Int64,1}, i::Int64, vertex_size::Int64)

The find parent algorithm is a recursive function to find the subeset of an item i.

# Arguments
- `parent::Array{Int64,1}`: Array of the subset of the items
- `i::Int64`: Index of the item
- `vertex_size::Int64`: Total size of the subeset
"""
function find_parent(parent::Array{Int64,1}, i::Int64, vertex_size::Int64)
    if parent[i] == vertex_size
        return i
    end
    return find_parent(parent, parent[i], vertex_size)
end



"""
    graph_cycle_check(graph::Dict{Int64,Array{Int64,1}})

The disjoint-set data structure principle is used to check if a direct or undirect 
graph contains a cycle. For this reason, the algorithm keeps the first track of a set 
of items partitioned into several disjoint (non-overlapping) subsets to find which 
subset a particular item is kept. This procedure is essential to figure out if two 
items are in the same subgroup. Next, the two subsets have to be merged into a single 
subset. For more information see: https://en.wikipedia.org/wiki/Disjoint-set_data_structure

# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = graph_cycle_true = Dict(1 => [2], 2 => [3], 3 => [1, 4])
julia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_true)
true
julia> graph = graph_cycle_false = Dict(1 => [2], 2 => [5], 3 => [1, 4])
julia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_false)
false
```
"""
function graph_cycle_check(graph::Dict{Int64,Array{Int64,1}})
    # Get the maximum length of the vertex
    vertex_size = find_global_maximum(graph)
    # Create array-list for finding the parents and intialize all subsets to vertex_size, because 
    # negative indixing is forbidden in Julia.
    parent = fill(vertex_size, vertex_size)

    # Iterate through all edges of graph for finding the subset of both vertices of every edge. 
    # If the two subsets are equal, then graph has a cycle inside. 
    for (i, values) in graph
        for j in values
            x = find_parent(parent, i, vertex_size)
            y = find_parent(parent, j, vertex_size)
            if x == y
                return true
            end
            x_set = find_parent(parent, x, vertex_size)
            y_set = find_parent(parent, y, vertex_size)
            parent[x_set] = y_set
        end
    end
    return false

end

"""
Provided by: https://discourse.julialang.org/t/sort-matrix-based-on-the-elements-of-a-specific-column/23475/5
"""
function sortrows(M, by = zeros(0))
    if by == zeros(0)
        order = copy(M)
    else
        order = copy(by)
    end
    if size(order, 2) > 1
        order = Int64.(order .- minimum(order, dims = 1))
        order = (order ./ maximum(order, dims = 1)) * (10) .^ (size(order, 2):-1:1)
    end
    order = sortperm(order[:, 1])
    return M[order, :], order
end

function minimum_spanning_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    vertex_size = find_global_maximum_complex(graph)

    # Because step on is sorting all the edges in non-decreasing order of their 
    # weight, the dictionary has to be translated into an array to be able to be 
    # sorted.
    graph_array = zeros(Int64, (vertex_size, 3))

    for (key, value) in graph
        for items in value
            graph_array[key, :] = [key, items[1], items[2]]
        end
    end


    graph_array = sortrows(graph_array, graph_array[:, [3]])

    # Create subsets in the size of the vertex with single elements
    parent = collect(Int64, 1:vertex_size)
    rank = zeros(Int64, vertex_size)
    result = zeros(Int64, false)
    # Number of edges to be taken is equal to vertex_size 
    i = 1 # An index variable, used for sorted edges 
    e = 1 # An index variable, used for result[] 
    while e < vertex_size

        # Step 2: Pick the smallest edge and increment the index for next iteration 
        u, v, w = graph_array[i]
        i += 1
        x = find_parent(parent, u, vertex_size)
        y = find_parent(parent, v, vertex_size)

        # If including this edge does't cause cycle, include it in result and 
        # increment the index of result for next edge 
        if x != y
            e += 1
            append!(result, [u, v, w])
            #  union of two sets of x and y by ranking 
            xroot = find_parent(parent, x, vertex_size)
            yroot = find_parent(parent, y, vertex_size)

            # Attach smaller rank tree under root of high rank tree (Union by Rank) 
            if rank[xroot] < rank[yroot]
                parent[xroot] = yroot
            elseif rank[xroot] > rank[yroot]
                parent[yroot] = xroot

            # If ranks are same, then make one as root and increment its rank by one 
            else
                parent[yroot] = xroot
                rank[xroot] += 1
            end
        end
        # Else discard the edge
    end
    return result
end

graph_with_weights_1 =
    Dict(1 => [(3, -2)], 2 => [(1, 4), (3, 3)], 3 => [(4, 2)], 4 => [(2, -1)])
minimum_spanning_tree(graph_with_weights_1)
#find_global_maximum_complex(graph_with_weights_1)
