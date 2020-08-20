"""
    breadth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

The breadth-first search (BFS) is an algorithm dedicated to traversing or searching for 
tree or graph data structures. It starts at a specified tree root (start) for exploring 
all connected neighbor nodes. The important feature is that the BFS  automatically leaves 
the present depth and passes on to the next nodes at a deeper level.
For more information see: https://en.wikipedia.org/wiki/Breadth-first_search

...
# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: graph of the connected nodes
- `start::Integer`: Startpoint of my graph-traveling process
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
    append!(queue, start)
    visited[start] = true
    
    while !isempty(queue)

        # Dequeue a vertex from  
        # queue and print it 
        start = popat!(queue, 1)
        append!(solution, start) 
        # Get all adjacent vertices of the dequeued vertex s. If a adjacent 
        # has not been visited, then mark it visited and enqueue it 
        for i in graph[start]
            # Adding +1 for Julia array indexing
            if visited[i] == false
                append!(queue, i)
                visited[i] = true
            end
        end
    end
    return solution
end

