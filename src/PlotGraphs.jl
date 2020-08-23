using TikzGraphs
using LightGraphs
g = DiGraph(4)
add_edge!(g, 1, 2)
add_edge!(g, 1, 3)
add_edge!(g, 2, 3)
add_edge!(g, 3, 1)
add_edge!(g, 3, 4)


add_edge!(g, (4, 4))
println(g)
TikzGraphs.plot(g, edge_styles=Dict((4,4)=>"loop right"))