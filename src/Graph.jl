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
            # Check if vertex has already been visited
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
    find_parent_in_cycle(parent::Array{Int64,1}, i::Int64, ref_key::Int64)

The find parent algorithm is a recursive function to find the subeset of an item i for 
graph test of being cycling.

# Arguments
- `parent::Array{Int64,1}`: Array of the subset of the items
- `i::Int64`: Index of the parents-item
- `ref_key::Int64`: Reference Key, which can be for example the total size of the subset
"""
function find_parent_in_cycle(parent::Array{Int64,1}, i::Int64, ref_key::Int64)
    if parent[i] == ref_key
        return i
    end
    return find_parent_in_cycle(parent, parent[i], ref_key)
end


"""
    find_parent_in_spanning_tree(parent::Array{Int64,1}, i::Int64, ref_key::Int64)

The find parent algorithm is a recursive function to find the subeset of an item i for 
graph test of having a spanning tree.

# Arguments
- `parent::Array{Int64,1}`: Array of the subset of the items
- `i::Int64`: Index of the parents-item
"""
function find_parent_in_spanning_tree(parent::Array{Int64,1}, i::Int64)
    if parent[i] == i
        return i
    end
    return find_parent_in_spanning_tree(parent, parent[i])
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
julia> graph_cycle_true = Dict(1 => [2], 2 => [3], 3 => [1, 4])
julia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_true)
true
julia> graph_cycle_false = Dict(1 => [2], 2 => [5], 3 => [1, 4])
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
            x = find_parent_in_cycle(parent, i, vertex_size)
            y = find_parent_in_cycle(parent, j, vertex_size)

            # Check if equal, then graph has a cycle
            if x == y
                return true
            end

            x_set = find_parent_in_cycle(parent, x, vertex_size)
            y_set = find_parent_in_cycle(parent, y, vertex_size)
            # Update the parent-set
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
    return M[order, :]
end


"""
    minimum_spanning_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}))

The minimum spanning tree (MST) algorithm detects a subset of the edges of a connected, 
edge-weighted undirected graph that connects all the vertices together. The MST algorithms 
focus is a) to exclude any cycles and b) to find the minimum possible total edge weight, 
which will create a spanning tree whose sum of edge weights is as small as possible. 
The Kruskal's algorithm is used to find the minimum spanning forest of an undirected 
edge-weighted graph. 
For more information see: https://en.wikipedia.org/wiki/Minimum_spanning_tree and 
https://en.wikipedia.org/wiki/Kruskal%27s_algorithm

# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with the weights

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph_with_spanning_tree = Dict(1 => [(2, 10), (3, 6), (4, 5)], 2 => [(4, 15)], 3 => [(4, 4)]
julia> ClassicAlgorithmsCollections.minimum_spanning_tree(graph_with_spanning_tree)
[3 4 4; 1 4 5; 1 2 10]
```
"""
function minimum_spanning_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    # Get the total number of nodes
    vertex_size = find_global_maximum_complex(graph)

    # Intialize array list
    graph_array = zeros(Int64, false)

    # Append the dictionary to 1D array
    for (key, value) in graph
        for items in value
            append!(graph_array, [key, items[1], items[2]])
        end
    end

    # Retransform from 1D-array to 2D-array with three columns for node, connected node, 
    # and weight.
    graph_array = adjoint(reshape(graph_array, (3, :)))
    # Because step on is sorting all the edges in non-decreasing order of their 
    # weight, the dictionary has to be translated into an array to be able to be 
    # sorted.
    graph_array = sortrows(graph_array, graph_array[:, [3]])

    # Create array-list for finding the parents and intialize all subsets to vertex_size 
    # with an increasing range, because it has to be reordered by the ranking later.
    parent = collect(Int64, 1:vertex_size)

    # Create an array for ranking
    rank = zeros(Int64, vertex_size)

    # Create a array list for the results
    result = zeros(Int64, false)

    # Number of edges to be taken is equal to vertex_size 
    i = 1 # An index variable, used for sorted edges 
    e = 1 # An index variable, used for result[] 
    while e < vertex_size
        # Step 2: Pick the smallest edge and increment the index for next iteration 
        u, v, w = graph_array[i, :]
        i += 1
        x = find_parent_in_spanning_tree(parent, u)
        y = find_parent_in_spanning_tree(parent, v)

        # If including this edge does't cause cycle, include it in result and 
        # increment the index of result for next edge 
        if x != y
            e += 1
            append!(result, [u, v, w])
            #  union of two sets of x and y by ranking 
            xroot = find_parent_in_spanning_tree(parent, x)
            yroot = find_parent_in_spanning_tree(parent, y)

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
    # Reshape the 1D array to 3D array
    return adjoint(reshape(result, (3, :)))
end


"""
bridge_check(
    graph::Dict{Int64,Array{Int64,1}},
    u::Int64,
    result::Array{Int64,1},
    visited::Array{Bool,1},
    parent::Array{Int64,1},
    low::Array{Int64,1},
    disc::Array{Int64,1},
    time::Int64,
)

For finding a bridge belonging to the current vertex, the algorithm has to remove firstly 
one by one all edges. Next, the algorithm has to see if the removal of an edge causes a 
disconnected graph. If yes, for the current pair of `u` and `v`, are a bridge between the 
endpoints is found.


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes
- `u::Int64`: Next to visit vertex
- `result::Array{Int64,1}`: Results of the graph bridges; start and endpoint of the bridge
- `visited::Array{Bool,1}`: Visited vertex
- `parent::Array{Int64,1}`: Parent vertices in DFS tree'
- `low::Array{Int64,1}`: Lowest vertex reachable from subtree 
- `disc::Array{Int64,1}`: Discovery time of the visited vertex 
- `time::Int64`: Current time

```
"""
function bridge_check(
    graph::Dict{Int64,Array{Int64,1}},
    u::Int64,
    result::Array{Int64,1},
    visited::Array{Bool,1},
    parent::Array{Int64,1},
    low::Array{Int64,1},
    disc::Array{Int64,1},
    time::Int64,
)

    # Mark the current node as visited and print it 
    visited[u] = true

    # Initialize discovery time
    disc[u] = time

    # Initialize low value 
    low[u] = time

    # Update time
    time += 1


    #Recur for all the vertices adjacent to this vertex 
    for v in graph[u]
        # If v is not visited yet, then make it a child of u 
        # in DFS tree and recur for it 
        if visited[v] == false
            parent[v] = u
            time, _ = bridge_check(graph, v, result, visited, parent, low, disc, time)

            # Check if the subtree rooted with v has a connection to 
            # one of the ancestors of u 
            low[u] = min(low[u], low[v])


            # If the lowest vertex reachable from subtree under v is below u in DFS tree, 
            # then u-v is a bridge
            if low[v] > disc[u]
                # This returns goes up to the recursive function
                append!(result, (u, v))
            end
        elseif v != parent[u] # Update low value of u for parent function calls. 
            low[u] = min(low[u], disc[v])
        end
    end
    return time, result
end


"""
    graph_bridge_check(graph::Dict{Int64,Array{Int64,1}}))

For finding a bridge or more bridges in an undirect connected graph, the kind of connection 
has to be found, which can disconnect the graph by removing it. In case of disconnected 
undirected graphs, the bridge is the connection which increases number of disconnected 
components by removing it.


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph_bridge = Dict(1 => [2, 3, 4], 2 => [1, 3], 3 => [1, 2], 4 => [1, 5], 5 => [4])
julia> ClassicAlgorithmsCollections.graph_bridge_check(graph_bridge)
[4 5; 1 4]
```
"""
function graph_bridge_check(graph::Dict{Int64,Array{Int64,1}})

    # Mark all the vertices as not visited and Initialize parent and visited,  
    # and ap(articulation point) arrays
    vertex_size = find_global_maximum(graph)

    #Create an array of visited nodes
    visited = zeros(Bool, vertex_size)

    disc = fill(99999, vertex_size)

    low = fill(99999, vertex_size)

    # 
    parent = fill(vertex_size, vertex_size)

    # Intialze the time
    time = 0
    # Create a array list for the results
    result = zeros(Int64, false)
    # Call the recursive helper function to find bridges 
    # in DFS tree rooted with vertex 'i'     
    for i in 1:vertex_size
        time, result = bridge_check(graph, i, result, visited, parent, low, disc, time)
    end

    return adjoint(reshape(result, (2, :)))
end


"""
    find_word(
        graph::Dict{Int64,Array{String,1}},
        visited::Array{Bool,2},
        i::Int64,
        j::Int64,
        size_v::Int64,
        size_h::Int64,
        current_word::String,
        reference_words::Array{String,1},
        result::Array{String,1},
    )

Based on the Depth First Traversal algorithm, words will be find for a current char by 
going through the graph up and down and keep track of the visited nodes. Important is that 
the travelling happens in both direction up and down and left and right. Everythign will be 
stacked in the visited list. If no word will be found the `current_word` has to be deleted. 

    # Arguments
    - `graph::Dict{Int64,Array{String,1}}`: Graph of the connected nodes of chars, which can build the words
    - `visited::Array{Bool,2}`: List of the visited chars in the graph
    - `i::Int64`: current row
    - `j::Int64`: current col
    - `size_v::Int64`: total size of rows
    - `size_h::Int64`: total size of cols
    - `current_word::String`: current joint word of chars
    - `reference_words::Array{String,1}`: Reference words to search for
    - `result::Array{String,1}`: List of the found words in the graph
"""
function find_word(
    graph::Dict{Int64,Array{String,1}},
    visited::Array{Bool,2},
    i::Int64,
    j::Int64,
    size_v::Int64,
    size_h::Int64,
    current_word::String,
    reference_words::Array{String,1},
    result::Array{String,1},
)
    # Mark current vertex (CHAR) as visited
    visited[i, j] = true

    # Add visit vertex to current_word, which will be set to empty string by every new call
    current_word *= graph[i][j]

    #  If current_word is present in reference_words, then return it and stop
    if current_word in reference_words && !(current_word in result)
        push!(result, String(current_word))
    else
        # Traverse adjacent cells of graph
        for k in 1:i+1
            if k <= size_v
                for l in 1:j+1
                    if l <= size_h
                        if !visited[k, l]
                            find_word(
                                graph,
                                visited,
                                k,
                                l,
                                size_v,
                                size_h,
                                current_word,
                                reference_words,
                                result,
                            )
                        end
                    end
                end
            end
        end


        # Erase current character from string
        current_word = chop(current_word, tail = length(current_word) - 1)
        # Mark current vertex (CHAR) as not visited anymore
        visited[i, j] = false

    end
    return result


end


"""
    boogle_word_check(
        graph::Dict{Int64,Array{String,1}},
        reference_words::Array{String,1},
    )

For finding words (`reference_words`) in a field of chars, the boogle word check algorithm 
goes for every single char up and down to see if the sum of the chars build a word 
contained in th refernce word list. For this porpose the  Depth First Traversal algorithm 
in function find_word is used.


# Arguments
- `graph::Dict{Int64,Array{String,1}}`: Graph of the connected nodes of chars, which can build the words
- `reference_words::Array{String,1}`: Reference words to search for

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> word_list = ["GEEKS", "FOR", "QUIZ", "GO"]
julia> graph_boogle = Dict(
        1 => ["G", "I", "Z"],
        2 => ["U", "E", "K"],
        3 => ["Q", "S", "E"],
        4 => ["D", "O", "P"],
        5 => ["F", "O", "R"],
        )
julia> ClassicAlgorithmsCollections.boogle_word_check(graph_boogle, word_list) ==
["GEEKS", "QUIZ", "FOR"]]
```
"""
function boogle_word_check(
    graph::Dict{Int64,Array{String,1}},
    reference_words::Array{String,1},
)

    size_v = length(keys(graph))
    size_h = length(collect(values(graph))[1])
    #Create an array of visited nodes
    visited = zeros(Bool, (size_v, size_h))

    # Create a array list for the results
    result = String[]

    init_str = string()
    for i in 1:size_v
        for j in 1:size_h
            result = find_word(
                graph,
                visited,
                i,
                j,
                size_v,
                size_h,
                init_str,
                reference_words,
                result,
            )

        end
    end
    return result
end
