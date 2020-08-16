function BFS(graph, s::Int64)

    # Mark all the vertices as not visited 
    visited = zeros(Int64, (length(collect(keys(graph)))))

    # Create a queue for BFS 
    queue = zeros(Int64, 0)

    # Mark the source node as  
    # visited and enqueue it 
    append!(queue, s)
    visited[s] = 1

    while queue

        # Dequeue a vertex from  
        # queue and print it 
        s = popat!(queue, 1)
        println(s, " ")

        # Get all adjacent vertices of the 
        # dequeued vertex s. If a adjacent 
        # has not been visited, then mark it 
        # visited and enqueue it 
        for i in graph[s]
            if visited[i] == 0
                append!(queue, i)
                visited[i] = 1
            end
        end
    end
end

graph = Dict(0=> [1, 2], 1=> [2], 2=> [0, 3], 3=> [3])
BFS(graph, 2)