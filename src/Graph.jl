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
    visited = zeros(Bool, (length(collect(keys(graph)))))

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
    visited = zeros(Bool, (length(collect(keys(graph)))))

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
    vertex_size = length(collect(keys(graph)))
    dist = fill(99999, (vertex_size, vertex_size))
    next = zeros(Int64, (vertex_size, vertex_size))
    # Updating the matrix with actual vertex values
    for (key, elements) in  graph
    # Setting the diagonal-elements of the weight matrix to 0
        dist[key, key] = 0
    # Setting the diagonal-elements of the next matrix to vertex
        next[key, key] = key
    # Weigthing of the edges
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
    if next[u, v] == 0
        return zeros(Int64, false)
    end

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
julia> graph = = Dict( 1 => [(3, -2)], 2 => [(1, 4),(3, 3)], 3 => [(4, 2)], 4 => [(2, -1)]
julia> ClassicAlgorithmsCollections.shortest_path_tree(graph, 2, 4)
([0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 1 0], [2, 1, 3, 4])
```
"""
function shortest_path_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}, u=nothing, v=nothing)
    
    dist, next, vertex_size = initialize_matrices(graph)

    for k in 1:vertex_size
        for i in 1:vertex_size
            for j in 1:vertex_size
                if dist[i, j] > dist[i, k] + dist[k, j]
                    dist[i, j] = dist[i, k] + dist[k, j]
                    next[i, j] = next[i, k]
                end
            end
        end
    end
    
    
    if !(isnothing(u) & isnothing(v))
        return dist, path_reconstruction(next, u, v)
    else
        return dist
    end

    
end
