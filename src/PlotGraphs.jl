using TikzGraphs
using LightGraphs

function small_graph()
    g = DiGraph(4)
    add_edge!(g, 1, 2)
    add_edge!(g, 1, 3)
    add_edge!(g, 2, 3)
    add_edge!(g, 3, 1)
    add_edge!(g, 3, 4)
    add_edge!(g, (4, 4))
    println(g)
    TikzGraphs.plot(g, edge_styles = Dict((4, 4) => "loop right"))
end

function small_graph_w_length()
    g = DiGraph(9)
    add_edge!(g, 1, 2)
    add_edge!(g, 1, 8)
    add_edge!(g, 2, 8)
    add_edge!(g, 2, 3)
    add_edge!(g, 3, 4)
    add_edge!(g, 3, 6)
    add_edge!(g, 3, 9)
    add_edge!(g, 4, 5)
    add_edge!(g, 4, 6)
    add_edge!(g, 5, 6)
    add_edge!(g, 6, 7)
    add_edge!(g, 7, 8)
    add_edge!(g, 7, 9)
    add_edge!(g, 8, 9)
    TikzGraphs.plot(
        g,
        edge_labels = Dict(
            (1, 2) => 4,
            (1, 8) => 8,
            (2, 8) => 11,
            (2, 3) => 8,
            (3, 4) => 7,
            (3, 6) => 4,
            (3, 9) => 2,
            (4, 5) => 9,
            (4, 6) => 14,
            (5, 6) => 10,
            (6, 7) => 2,
            (7, 8) => 1,
            (7, 9) => 6,
            (8, 9) => 7,
        ),
    )
end

small_graph_w_length()
