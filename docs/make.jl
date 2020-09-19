using Documenter, ClassicAlgorithmsCollections


makedocs(
    modules = [ClassicAlgorithmsCollections],
    sitename = "ClassicAlgorithmsCollections.jl",
    authors = "Anselm Hahn <Anselm.Hahn@gmail.com>",
    doctest = true,
    linkcheck = true,
    format = Documenter.HTML(
        # Use clean URLs, unless built as a "local" build
        prettyurls = !("local" in ARGS),
        canonical = "https://anselmoo.github.io/ClassicAlgorithmsCollections/",
        highlights = ["yaml"],
    ),
    pages = [
        "Home" => "index.md",
        "Guide" => "man/guide.md",
        "Algorithms" => Any["Sorting and Searching"=>"man/SortingAndSearching.md"],
    ],
)


deploydocs(
    repo = "https://github.com/Anselmoo/ClassicAlgorithmsCollections.git",
    target = "build",
    push_preview = true,
)