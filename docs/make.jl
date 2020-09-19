using Documenter, ClassicAlgorithmsCollections


makedocs(
    modules = [ClassicAlgorithmsCollections],
    sitename = "ClassicAlgorithmsCollections.jl",
    #authors = ["Anselm Hahn <Anselm.Hahn@gmail.com>"],
    #doctest = true,
    #linkcheck = true,
    #format = Documenter.HTML(prettyurls = !("local" in ARGS)),
    #pages = [
    #    "Home" => "index.md",
    #    "Guide" => "man/guide.md",
    #    "Algorithms" => Any["Sorting and Searching"=>"man/SortingAndSearching.md"],
    #],
)


deploydocs(
    repo = "https://github.com/Anselmoo/ClassicAlgorithmsCollections.git",
#    target = "build",
#    julia = "1.5",
#    osname = "linux",
#    deps = nothing,
#    make = nothing,
)