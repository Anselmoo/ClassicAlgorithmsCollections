using Documenter, ClassicAlgorithmsCollections

makedocs(
    modules = [ClassicAlgorithmsCollections],
    sitename = "ClassicAlgorithmsCollections.jl",
    authors = ["Anselm Hahn <Anselm.Hahn@gmail.com>"]
    doctest = true,
    linkcheck = true,
    format = Documenter.HTML(prettyurls=!("local" in ARGS)),
    pages = [
        "Home" => "index.md",
        "Guide" => "man/guide.md",
        "Algorithms" => Any["Sorting and Searching"=>"man/SortingAndSearching.md",
        #"man/examples.md",
        #"man/syntax.md",
        #"man/doctests.md",
        #"man/latex.md",
        #hide("man/hosting.md", [
        #    "man/hosting/walkthrough.md"
        #]),
        #"man/other-formats.md",
        ],
    ],
)

#deploydocs(repo = "github.com/JuliaLang/Example.jl.git")


deploydocs(
    repo    = "https://github.com/Anselmoo/ClassicAlgorithmsCollections.git",
    target  = "build",
    # julia   = "0.6",
    # osname  = 'linux',
    deps    = nothing,
    make    = nothing,
)
