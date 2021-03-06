using ClassicAlgorithmsCollections
using Documenter


makedocs(
    modules = [ClassicAlgorithmsCollections],
    authors = "Anselm Hahn <Anselm.Hahn@gmail.com>",
    repo = "https://github.com/Anselmoo/ClassicAlgorithmsCollections/blob/{commit}{path}#L{line}",
    sitename = "ClassicAlgorithmsCollections.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://Anselmoo.github.io/ClassicAlgorithmsCollections",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
        "Guide" => "man/guide.md",
        "Algorithms" => Any[
            "Sorting and Searching"=>"man/SortingAndSearching.md",
            "String and Arrays"=>"man/StringsAndArrays.md",
            "Graph"=>"man/Graph.md",
            "BITS"=>"man/Bits.md",
            "Dynamic Programming"=>"man/DynamicProgramming.md",
            "Number Theory"=>"man/NumberTheory.md",
        ],
    ],
)

deploydocs(;
    repo = "github.com/Anselmoo/ClassicAlgorithmsCollections",
    versions = ["stable" => "v^", "v#.#", "dev" => "dev"],
    push_preview    = true,
)
