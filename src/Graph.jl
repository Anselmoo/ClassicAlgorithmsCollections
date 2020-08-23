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
- `start::Int64`: Startpoint of my graph-traveling process
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
- `start::Int64`: Startpoint of my graph-traveling process
- `visited::Array{Bool,1}`: Visited nodes of my graph
- `solution::Array{Int64,1}`: Solution of my raph-traveling proces
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
DFS is stack-based For more information see: https://en.wikipedia.org/wiki/Depth-first_search

...
# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint of my graph-traveling process
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
