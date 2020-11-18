var documenterSearchIndex = {"docs":
[{"location":"man/filler/#Algorithms","page":"Algorithms","title":"Algorithms","text":"","category":"section"},{"location":"man/StringsAndArrays/#Strings","page":"String and Arrays","title":"Strings","text":"","category":"section"},{"location":"man/StringsAndArrays/","page":"String and Arrays","title":"String and Arrays","text":"reverse_pure_string","category":"page"},{"location":"man/StringsAndArrays/#ClassicAlgorithmsCollections.reverse_pure_string","page":"String and Arrays","title":"ClassicAlgorithmsCollections.reverse_pure_string","text":"reverse_pure_string(text::String)\n\nReverse only the non-special characters (alphabet: 'a', to 'z' and 'A' to 'Z') and letting the rest untouched. For this purpose, reverse_pure_string is scanning through the string as an array, and if the current character is not special, it will reverse the elements by swapping; vice versa, if the current character is a special element, the boundaries will be modified.\n\nArguments\n\ntext::String: String with special character like !,<#\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> string = \"a!!!b.c79.d,e'f,ghi3###\"\"\njulia> ClassicAlgorithmsCollectionsreverse_pure_string(string)\n\"a!!!b.c79.d,e'f,ghi3###\"\"\n\n\n\n\n\n","category":"function"},{"location":"man/StringsAndArrays/#Array-Analysis","page":"String and Arrays","title":"Array-Analysis","text":"","category":"section"},{"location":"man/StringsAndArrays/","page":"String and Arrays","title":"String and Arrays","text":"combinations_of_2arrays\ncount_triplet_elements\ncount_pythagorean_elements\nfind_maxlength_subarray\nfind_smallest_nonelement\nsmallest_subset4sum\nsum_of_postive_gradients\nzigzag_ordering","category":"page"},{"location":"man/StringsAndArrays/#ClassicAlgorithmsCollections.combinations_of_2arrays","page":"String and Arrays","title":"ClassicAlgorithmsCollections.combinations_of_2arrays","text":"combinations_of_2arrays(array_1::Array{Int64,1}, array_2::Array{Int64,1}))\n\nProvides all combinations of sorted arrays with an increasing number of elements. Original idea\n\nArguments\n\narray_1::Array{Int64,1}: First sorted array\narray_2::Array{Int64,1}: Second sorted array\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr_1 = [10, 15, 25]\njulia> arr_2 = [5, 20, 30]\njulia> ClassicAlgorithmsCollections.combinations_of_2arrays(arr_1, arr_2)\n[10, 20]\n[10, 20, 25, 30]\n[10, 30]\n[15, 20]\n[15, 20, 25, 30]\n[15, 30]\n[25, 30]\n\n\n\n\n\n","category":"function"},{"location":"man/StringsAndArrays/#ClassicAlgorithmsCollections.count_triplet_elements","page":"String and Arrays","title":"ClassicAlgorithmsCollections.count_triplet_elements","text":"count_triplet_elements(array::Array{Int64,1}, sum::Int64)\n\nCounting the number of three elements in the array, which sum is equal to the reference sum.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array\narray::Array{Int64,1}: Refernece sum\n\nExamples\n\n```julia-repl julia> import ClassicAlgorithmsCollections julia> arr = [5, 1, 3, 4, 7] julia> sum = 12 julia> ClassicAlgorithmsCollections.counttripletelements(arr, sum) 2\n\nNotes:\n\n\n\nThis should be implemented recursively instead of using three for-loops because it will allow using any conditions.\n\n\n\n\n\n","category":"function"},{"location":"man/StringsAndArrays/#ClassicAlgorithmsCollections.count_pythagorean_elements","page":"String and Arrays","title":"ClassicAlgorithmsCollections.count_pythagorean_elements","text":"count_pythagorean_elements(array::Array{Int64,1})\n\nCounting the number of Pythagorean-elements in the array, which sum is equal to A^2 + B^2 = C^2.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13 ,12]\njulia> ClassicAlgorithmsCollections.count_pythagorean_elements(arr, sum)\n3\n\n\n\n\n\n","category":"function"},{"location":"man/StringsAndArrays/#ClassicAlgorithmsCollections.find_smallest_nonelement","page":"String and Arrays","title":"ClassicAlgorithmsCollections.find_smallest_nonelement","text":"find_smallest_nonelement(array::Array{Int64,1})\n\nReturns the smallest number of a sorted array that cannot be represented as sum of subset of elements from this array.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [1, 2, 5, 10, 20, 40]\njulia> ClassicAlgorithmsCollections.find_smallest_nonelement(arr)\n4\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#Graph-Search","page":"Graph","title":"Graph-Search","text":"","category":"section"},{"location":"man/Graph/","page":"Graph","title":"Graph","text":"breadth_first_search\ndepth_first_search","category":"page"},{"location":"man/Graph/#ClassicAlgorithmsCollections.breadth_first_search","page":"Graph","title":"ClassicAlgorithmsCollections.breadth_first_search","text":"breadth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)\n\nThe breadth-first search (BFS) is an algorithm dedicated to traversing or searching for tree or graph data structures. It starts at a specified tree root (start) for exploring all connected neighbor nodes. The important feature is that the BFS automatically leaves the present depth and passes on to the next nodes at a deeper level. BFS is queue-based. For more information see: https://en.wikipedia.org/wiki/Breadth-first_search\n\nArguments\n\ngraph::Dict{Int64,Array{Int64,1}}: Graph of the connected nodes\nstart::Int64: Startpoint (first selected vertex) of the graph-traveling process\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])\njulia> ClassicAlgorithmsCollections.breadth_first_search(graph, 3)\n[3, 1, 4, 2]\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#ClassicAlgorithmsCollections.depth_first_search","page":"Graph","title":"ClassicAlgorithmsCollections.depth_first_search","text":"depth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)\n\nThe depth-first search (DFS) is an algorithm dedicated to traversing or searching for tree or graph data structures. It starts at a specified tree root (start) for exploring as far as possible at each branch. Afterthat the BFS starts automatically backtracking. DFS is stack-based. For more information see: https://en.wikipedia.org/wiki/Depth-first_search\n\nArguments\n\ngraph::Dict{Int64,Array{Int64,1}}: Graph of the connected nodes\nstart::Int64: Startpoint (first selected vertex) of the graph-traveling process\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])\njulia> ClassicAlgorithmsCollections.depth_first_search(graph, 3)\n[3, 1, 2, 4]\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#Graph-Tree","page":"Graph","title":"Graph-Tree","text":"","category":"section"},{"location":"man/Graph/","page":"Graph","title":"Graph","text":"minimum_spanning_tree\nshortest_path_tree","category":"page"},{"location":"man/Graph/#ClassicAlgorithmsCollections.minimum_spanning_tree","page":"Graph","title":"ClassicAlgorithmsCollections.minimum_spanning_tree","text":"minimum_spanning_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}))\n\nThe minimum spanning tree (MST) algorithm detects a subset of the edges of a connected, edge-weighted undirected graph that connects all the vertices together. The MST algorithms focus is a) to exclude any cycles and b) to find the minimum possible total edge weight, which will create a spanning tree whose sum of edge weights is as small as possible. The Kruskal's algorithm is used to find the minimum spanning forest of an undirected edge-weighted graph. For more information see: https://en.wikipedia.org/wiki/Minimumspanningtree and https://en.wikipedia.org/wiki/Kruskal%27s_algorithm\n\nArguments\n\ngraph::Dict{Int64,Array{Tuple{Int64,Int64},1}}: Graph of the connected nodes with the weights\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> graph_with_spanning_tree = Dict(1 => [(2, 10), (3, 6), (4, 5)], 2 => [(4, 15)], 3 => [(4, 4)]\njulia> ClassicAlgorithmsCollections.minimum_spanning_tree(graph_with_spanning_tree)\n[3 4 4; 1 4 5; 1 2 10]\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#ClassicAlgorithmsCollections.shortest_path_tree","page":"Graph","title":"ClassicAlgorithmsCollections.shortest_path_tree","text":"shortest_path_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}, u=nothing, v=nothing)\n\nThe Shortest Path Tree (SPT) algorithm solves the shortest path problem between every pair of vertices in a given edge-weighted directed Graph based on the Floyd–Warshall algorithm. Optional, the SPT also provides the total parts between a start- (u) and end- point (v). For more information see: https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm\n\nArguments\n\nnext::Array{Int64,2}: Vertex matrix of the connected nodes\nu::Int64: Startpoint of the to investigated path; optional\nv::Int64: Endpoint of the to investigated path; optional\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> graph = Dict( 1 => [(3, -2)], 2 => [(1, 4),(3, 3)], 3 => [(4, 2)], 4 => [(2, -1)]\njulia> ClassicAlgorithmsCollections.shortest_path_tree(graph, 2, 4)\n([0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 1 0], [2, 1, 3, 4])\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#Graph-Check","page":"Graph","title":"Graph-Check","text":"","category":"section"},{"location":"man/Graph/","page":"Graph","title":"Graph","text":"graph_cycle_check\ngraph_bridge_check\nboogle_word_check","category":"page"},{"location":"man/Graph/#ClassicAlgorithmsCollections.graph_cycle_check","page":"Graph","title":"ClassicAlgorithmsCollections.graph_cycle_check","text":"graph_cycle_check(graph::Dict{Int64,Array{Int64,1}})\n\nThe disjoint-set data structure principle is used to check if a direct or undirect graph contains a cycle. For this reason, the algorithm keeps the first track of a set of items partitioned into several disjoint (non-overlapping) subsets to find which subset a particular item is kept. This procedure is essential to figure out if two items are in the same subgroup. Next, the two subsets have to be merged into a single subset. For more information see: https://en.wikipedia.org/wiki/Disjoint-setdatastructure\n\nArguments\n\ngraph::Dict{Int64,Array{Int64,1}}: Graph of the connected nodes\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> graph_cycle_true = Dict(1 => [2], 2 => [3], 3 => [1, 4])\njulia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_true)\ntrue\njulia> graph_cycle_false = Dict(1 => [2], 2 => [5], 3 => [1, 4])\njulia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_false)\nfalse\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#ClassicAlgorithmsCollections.graph_bridge_check","page":"Graph","title":"ClassicAlgorithmsCollections.graph_bridge_check","text":"graph_bridge_check(graph::Dict{Int64,Array{Int64,1}}))\n\nFor finding a bridge or more bridges in an undirect connected graph, the kind of connection has to be found, which can disconnect the graph by removing it. In case of disconnected undirected graphs, the bridge is the connection which increases number of disconnected components by removing it.\n\nArguments\n\ngraph::Dict{Int64,Array{Tuple{Int64,Int64},1}}: Graph of the connected nodes\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> graph_bridge = Dict(1 => [2, 3, 4], 2 => [1, 3], 3 => [1, 2], 4 => [1, 5], 5 => [4])\njulia> ClassicAlgorithmsCollections.graph_bridge_check(graph_bridge)\n[4 5; 1 4]\n\n\n\n\n\n","category":"function"},{"location":"man/Graph/#ClassicAlgorithmsCollections.boogle_word_check","page":"Graph","title":"ClassicAlgorithmsCollections.boogle_word_check","text":"boogle_word_check(\n    graph::Dict{Int64,Array{String,1}},\n    reference_words::Array{String,1},\n)\n\nFor finding words (reference_words) in a field of chars, the boogle word check algorithm goes for every single char up and down to see if the sum of the chars build a word contained in th refernce word list. For this porpose the  Depth First Traversal algorithm in function find_word is used.\n\nArguments\n\ngraph::Dict{Int64,Array{String,1}}: Graph of the connected nodes of chars, which can build the words\nreference_words::Array{String,1}: Reference words to search for\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> word_list = [\"GEEKS\", \"FOR\", \"QUIZ\", \"GO\"]\njulia> graph_boogle = Dict(\n        1 => [\"G\", \"I\", \"Z\"],\n        2 => [\"U\", \"E\", \"K\"],\n        3 => [\"Q\", \"S\", \"E\"],\n        4 => [\"D\", \"O\", \"P\"],\n        5 => [\"F\", \"O\", \"R\"],\n        )\njulia> ClassicAlgorithmsCollections.boogle_word_check(graph_boogle, word_list)\n[\"GEEKS\", \"QUIZ\", \"FOR\"]\n\n\n\n\n\n","category":"function"},{"location":"man/NumberTheory/#Number-Theory","page":"Number Theory","title":"Number-Theory","text":"","category":"section"},{"location":"man/NumberTheory/","page":"Number Theory","title":"Number Theory","text":"chinese_remainder_theorem\neuler_totient\nmodular_exponentiation\nmodular_inverse\nsieve_of_eratosthenes","category":"page"},{"location":"man/NumberTheory/#ClassicAlgorithmsCollections.chinese_remainder_theorem","page":"Number Theory","title":"ClassicAlgorithmsCollections.chinese_remainder_theorem","text":"chinese_remainder_theorem(array::Array{Int64}, remainder::Array{Int64}))\n\nThe Chinese remainder theorem is based on simultaneous congruence. In more detail, if x knows the remainder of the Euclidean division of an array[i] by several integers, then x can determine the remainder of the division of array[i] by the product of these integers uniquely, following the condition that the divisors are pairwise coprime. For more information see: https://en.wikipedia.org/wiki/Chineseremaindertheorem\n\nArguments\n\narray::Array{Int64}: Array with elements.\nremainder::Array{Int64}: Number of elements\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> num = [3, 4, 5]\njulia> rem = [2, 3, 1]\njulia> ClassicAlgorithmsCollections.chinese_remainder_theorem(num, rem)\n11\n\n\n\n\n\n","category":"function"},{"location":"man/NumberTheory/#ClassicAlgorithmsCollections.euler_totient","page":"Number Theory","title":"ClassicAlgorithmsCollections.euler_totient","text":"euler_totient(n::Int64)\n\nCompute the positive integers up to a given integer n that are relatively prime to n; also known as Euler's totient. For more information see: https://en.wikipedia.org/wiki/Euler%27stotientfunction\n\nArguments\n\nn::Int64: Number of elements\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.euler_totient(20)\n[1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8, 8, 16, 6, 18, 8]\n\n\n\n\n\n","category":"function"},{"location":"man/NumberTheory/#ClassicAlgorithmsCollections.modular_exponentiation","page":"Number Theory","title":"ClassicAlgorithmsCollections.modular_exponentiation","text":"modular_exponentiation(base::Int64, exponent::Int64, modulus::Int64)\n\nCompute the residuum of the base raised to the exponent, which is divided by the modulus.\n\nArguments\n\nbase::Int64: base\nexponent::Int64: exponent\nmodulus ::Int64: modulus\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.modular_exponentiation(2, 3, 15)\n8\n\n\n\n\n\n","category":"function"},{"location":"man/NumberTheory/#ClassicAlgorithmsCollections.modular_inverse","page":"Number Theory","title":"ClassicAlgorithmsCollections.modular_inverse","text":"modular_inverse(base::Int64, modulus::Int64)\n\nCompute the multiplicative inverse of the base under the modulus.\n\nArguments\n\nbase::Int64: base\nmodulus ::Int64: modulus\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.modular_inverse(3, 11)\n4\n\n\n\n\n\n","category":"function"},{"location":"man/NumberTheory/#ClassicAlgorithmsCollections.sieve_of_eratosthenes","page":"Number Theory","title":"ClassicAlgorithmsCollections.sieve_of_eratosthenes","text":"sieve_of_eratosthenes(n::Int64)\n\nThe Sieve of Eratosthenes is one of the historical algorithms dedicated to finding all prime numbers up to any given limit. The algorithm is split into four steps:\n\nCreate a list of sequential integers from 2 to n.\nDefine initially p=2 as the first prime number.\nReconstruct all multiple combinations from p=2.\nFind the first number greater than p in the array that is not listed. Then decided:\n\n* If no number exists => stop. \n* `p` becomes equal to the number and go back to step 3.\n\nFor more information see: https://en.wikipedia.org/wiki/SieveofEratosthenes\n\nArguments\n\nn::Int64: Number of elements\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.sieve_of_eratosthenes(50)\n[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]\n\n\n\n\n\n","category":"function"},{"location":"man/guide/#Package-Guide","page":"Guide","title":"Package Guide","text":"","category":"section"},{"location":"man/guide/#Installation","page":"Guide","title":"Installation","text":"","category":"section"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"ClassicAlgorithmsCollections is a registered package and so can be installed via Pkg.add.","category":"page"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"Pkg.add(\"ClassicAlgorithmsCollections\")","category":"page"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"This package supports Julia ≥1.5.","category":"page"},{"location":"man/guide/#Usage","page":"Guide","title":"Usage","text":"","category":"section"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"To use ClassicAlgorithmsCollections.jl in your project,","category":"page"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"using ClassicAlgorithmsCollections","category":"page"},{"location":"man/guide/#Accessing-Documentation-from-REPL","page":"Guide","title":"Accessing Documentation from REPL","text":"","category":"section"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"All docs found here can also be accessed via REPL through Julia's help functionality.","category":"page"},{"location":"man/guide/","page":"Guide","title":"Guide","text":"julia> using ClassicAlgorithmsCollections\n\n","category":"page"},{"location":"man/Bits/#Bit-Manipulation","page":"BITS","title":"Bit-Manipulation","text":"","category":"section"},{"location":"man/Bits/","page":"BITS","title":"BITS","text":"count_total_bits\nget_single_integer\nint2binary\nmagic_number\nmaximum_xor_subarray\nsum_of_bit_difference\nswapping_even_odd_bits","category":"page"},{"location":"man/Bits/#ClassicAlgorithmsCollections.count_total_bits","page":"BITS","title":"ClassicAlgorithmsCollections.count_total_bits","text":"count_total_bits(n::Int64)\n\nCalculates the total number of bits from 1 to n for a given integer n by combing a  while-loop for building the binary subsets with a range for-loop for counting the bits.\n\nArguments\n\nn::Int64: Integer value which has to be evaluated.\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.count_total_bits(17)\n35\n\n\n\n\n\n","category":"function"},{"location":"man/Bits/#ClassicAlgorithmsCollections.get_single_integer","page":"BITS","title":"ClassicAlgorithmsCollections.get_single_integer","text":"get_single_integer(array::Array{Int64,1})\n\nFor finding the single element in an array, where every other elements appear three times.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array with threetimes elements and one single element.\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [12, 1, 12, 3, 12, 1, 1, 2, 3, 3]\njulia> ClassicAlgorithmsCollections.get_single_integer(arr)\n2\n\n\n\n\n\n","category":"function"},{"location":"man/Bits/#ClassicAlgorithmsCollections.int2binary","page":"BITS","title":"ClassicAlgorithmsCollections.int2binary","text":"int2binary(n::Int64, array=zeros(Int64,0))\n\nConverts any integer to a binary representation as initiger array with 0, 1.\n\nArguments\n\nn::Int64: Integer value which has to be converted\narray=zeros(Int64,0): Empty array for return\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.int2binary(131)\n([1,0,0,0,0,0,1,1],1)\n\n\n\n\n\n","category":"function"},{"location":"man/Bits/#ClassicAlgorithmsCollections.magic_number","page":"BITS","title":"ClassicAlgorithmsCollections.magic_number","text":"magic_number(n::Int64))\n\nA magic number has to build as the power of 5 or the sum of unique powers of 5. First few magic numbers are:     1. 5     2. 5^2 = 25     3. 5 + 25 = 30     4. 5^3 = 125     5. 125 + 5 = 130\n\nArguments\n\nn::Int64: Integer value of the number, which has to become a magic number\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.magic_number(5)\n130\n\n\n\n\n\n","category":"function"},{"location":"man/Bits/#ClassicAlgorithmsCollections.maximum_xor_subarray","page":"BITS","title":"ClassicAlgorithmsCollections.maximum_xor_subarray","text":"maximum_xor_subarray(array::Array{Int64,1})\n\nFor finding the maximum XOR value of a subarray by running two nested for-loops. The first for-loop is intializing the current XOR value, the second for-loop is generating the BIT-XOR and compared the current value with the temporary largest value.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [8, 1, 2, 12, 45, 100, 43]\njulia> ClassicAlgorithmsCollections.maximum_xor_subarray(arr)\n110\n\n\n\n\n\n","category":"function"},{"location":"man/Bits/#ClassicAlgorithmsCollections.sum_of_bit_difference","page":"BITS","title":"ClassicAlgorithmsCollections.sum_of_bit_difference","text":"sum_of_bit_difference(array::Array{Int64,1})\n\nFor finding the sum of bit differences in all pairs of an array, the array will be transformed into a series of subarrays  for a given bit-length.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [8, 1, 2, 12, 45, 100, 43]\njulia> ClassicAlgorithmsCollections.maximum_xor_subarray(arr)\n104\n\n\n\n\n\n","category":"function"},{"location":"man/Bits/#ClassicAlgorithmsCollections.swapping_even_odd_bits","page":"BITS","title":"ClassicAlgorithmsCollections.swapping_even_odd_bits","text":"swapping_even_odd_bits(n::Int64))\n\nFor a given integer value, all odd bits will be swapped with even bits.\n\nArguments\n\nn::Int64: Integer value of the number, which has to be swapped.\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.function swapping_even_odd_bits(23)\n43\n\nNotes\n\n\n\nThe definition of the even and odd bits:\n\neven_bits = n & 0xAAAAAAAA\nodd_bits = n & 0x55555555\n\n\n\n\n\n","category":"function"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = ClassicAlgorithmsCollections","category":"page"},{"location":"#ClassicAlgorithmsCollections.jl","page":"Home","title":"ClassicAlgorithmsCollections.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"A package with a collection of classical algorithms re-implemented in JULIA.","category":"page"},{"location":"","page":"Home","title":"Home","text":"note: Note\nThe ClassicAlgorithmsCollections.jl is initially inspired by Geeksforgeeks' Top-10-Algorithms-in-Interview-Questions and should be continuously expanded by new algorithms or more elegant implementations.","category":"page"},{"location":"#Content","page":"Home","title":"Content","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Pages = [\n    \"man/guide.md\",\n    \"man/filler.md\",\n    \"man/SortingAndSearching.md\",\n    \"man/StringsAndArrays.md\",\n    \"man/Graph.md\",\n    \"man/Bits.md\",\n    \"man/DynamicProgramming.md\",\n    \"man/NumberTheory.md\",\n]\nDepth = 2","category":"page"},{"location":"#Functions","page":"Home","title":"Functions","text":"","category":"section"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"man/DynamicProgramming/#Dynamic-Programming","page":"Dynamic Programming","title":"Dynamic-Programming","text":"","category":"section"},{"location":"man/DynamicProgramming/","page":"Dynamic Programming","title":"Dynamic Programming","text":"knapsack_solver\nlis_length\nminumum_operations\nnumber_of_steps\nsubset_sum_test","category":"page"},{"location":"man/DynamicProgramming/#ClassicAlgorithmsCollections.number_of_steps","page":"Dynamic Programming","title":"ClassicAlgorithmsCollections.number_of_steps","text":"number_of_steps(distance::Int64, step_size::Int64)\n\nNumber of stepsize is calculating the total number of combinations for walking a distance for a given number of stepsize. For example, for a distance of 3 with a maximum step_size of 3 will provide for possible combinations:\n\n- 1 step + 1 step + 1 step\n- 1 step + 2 step\n- 2 step + 1 step\n- 3 step\n\nArguments\n\ndistance::Int64: Distance to go\nstep_size::Int64: Maximum step size of walking a distance\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> ClassicAlgorithmsCollections.number_of_steps(8,3)\n81\n\n\n\n\n\n","category":"function"},{"location":"man/DynamicProgramming/#ClassicAlgorithmsCollections.subset_sum_test","page":"Dynamic Programming","title":"ClassicAlgorithmsCollections.subset_sum_test","text":"subset_sum_test(array::Array{Int64,1}, target::Int64)\n\nThe recursive expression tests if there is a subset in the array, where the sum of the subset is equal to the target.\n\nArguments\n\narray::Array{Int64,1}: Array with a possible sum of a subsequence.\ntarget::Int64: Target sum of the subsequence, which should be included in the array.\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> set = [3, 34, 4, 12, 5, 2]\njulia> sum = 9\njulia> ClassicAlgorithmsCollections.subset_sum_test(set, sum)\ntrue\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#Array-Search","page":"Sorting and Searching","title":"Array-Search","text":"","category":"section"},{"location":"man/SortingAndSearching/","page":"Sorting and Searching","title":"Sorting and Searching","text":"binary_search\nbinary_pivot_search\nclosest_pair_search\ninterpolation_search","category":"page"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.binary_search","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.binary_search","text":"binary_search(array::Array{Int64,1}, target::Int64)\n\nThe binary search algorithm (BSA) finds a target value's position within a sorted array by using a half-interval cut per each cycle. Thus, the BSA compares the target value to the value of the array's middle element. In the case of inequality, the half array-piece in which the target cannot be will be erased. Next, the search continues on the remaining half array-piece and starts taking the middle element to compare it to the target value. This procedure has to be continued until the target value is found. The search may have to be stopped with a remaining empty half array-piece; consequently, the target is not in the array. For more information see: https://en.wikipedia.org/wiki/Binarysearchalgorithm\n\nArguments\n\narray::Array{Int64,1}: Sorted array of integers\ntarget::Int64: Target-value to find the position\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [10,11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]\njulia> target = 12\njulia> ClassicAlgorithmsCollections.binary_search(arr, target)\n3\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.binary_pivot_search","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.binary_pivot_search","text":"binary_pivot_search(array::Array{Int64,1}, target::Int64)\n\nThe idea is to find the pivot point for finding the target in an unsorted array. For this reason, the array has to be divided into two subarrays; a binary search is performed on the subarrays.\n\nArguments\n\narray::Array{Int64,1}: Unsorted array of integers\ntarget::Int64: Target-value to find the position\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]\njulia> target = 3\njulia> ClassicAlgorithmsCollections.binary_pivot_search(arr, target)\n8\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.interpolation_search","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.interpolation_search","text":"interpolation_search(array::Array{Int64,1}, target::Int64)\n\nThe Interpolation search algorithm (ISA) finds a target-position in a sorted array by using a numerical procedure. The sorting procedure uses a linear fitting for finding the target position of the remaining search space in the array in more detail. The array's target position is calculated by the straight slope between the lowest and largest boundary of the remaining array and the lowest array position itself during each optimization cycle. If the target-position cannot be found, the array-space will be shrink for the lower or higher boundary region based on a comparison. For more information see: https://en.wikipedia.org/wiki/Interpolation_search\n\nArguments\n\narray::Array{Int64,1}: Sorted array of integers\ntarget::Int64: Target-value to find the position\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [10,11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]\njulia> target = 12\njulia> ClassicAlgorithmsCollections.interpolation_search(arr, target)\n3\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#Array-Sorting","page":"Sorting and Searching","title":"Array-Sorting","text":"","category":"section"},{"location":"man/SortingAndSearching/","page":"Sorting and Searching","title":"Sorting and Searching","text":"bubble_sorting\ninsertion_sorting\nheap_sorting\nmerge_sorting\nquick_sorting","category":"page"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.bubble_sorting","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.bubble_sorting","text":"bubble_sorting(array::Array{Int64,1})\n\nThe Bubble sorting algorithm (BSA) is a primitive sorting algorithm that repeatedly steps through the array by using a double for-loop with n and n-1 size. During the walkthrough, the BSA compares adjacent elements and swaps wrong ordered elements until the array is sorted. For more information see: https://en.wikipedia.org/wiki/Bubble_sort\n\nArguments\n\narray::Array{Int64,1}: Unsorted array of integers\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [64, 34, 25, 12, 22, 11, 90]\njulia> ClassicAlgorithmsCollections.bubble_sorting(arr)\n[11, 12, 22, 25, 34, 64, 90]\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.insertion_sorting","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.insertion_sorting","text":"insertion_sorting(array::Array{Int64,1})\n\nThe insertion sorting algorithm builds the final sorted array by inserting elements that are greater than the key, to one position ahead of their current position step one item at a time. For more information see: https://en.wikipedia.org/wiki/Insertion_sort\n\nArguments\n\narray::Array{Int64,1}: Unsorted array of integers\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [64, 34, 25, 12, 22, 11, 90]\njulia> ClassicAlgorithmsCollections.insertion_sorting(arr)\n[11, 12, 22, 25, 34, 64, 90]\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.heap_sorting","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.heap_sorting","text":"heap_sorting(array::Array{Int64,1})\n\nAs a comparison-based sorting algorithm, the heapsort algorithm (HSA) divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element from it and inserting it into the sorted region. A specialty is that the HSA keeps the unsorted region in a heap data structure to find the largest element in each step more quickly. In more detail, in the first part of the HSA (while-loop), the largest value has to be found and set to position one. In the second part of the HSA (while-loop), the array's first and largest value has to be swap to the last index of the array, and the swapping-procedure starts again for a new interval n-1. For more information see: https://en.wikipedia.org/wiki/Heapsort\n\nArguments\n\narray::Array{Int64,1}: Unsorted array of integers\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [64, 34, 25, 12, 22, 11, 90]\njulia> ClassicAlgorithmsCollections.heap_sorting(arr)\n[11, 12, 22, 25, 34, 64, 90]\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.merge_sorting","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.merge_sorting","text":"merge_sorting(array::Array{Int64,1})\n\nThe merge sort algorithms (MSA) are a comparison-based sorting algorithm, which is referred to as the divide and conquer algorithms.  The stable sort implementation is a widely used method for the MSA, which means that the order of equal elements is the same in the input and output. In the current implementation, a top-down implementation is used; however, a Bottom-up implementation can be used, too. In the top-down implementation, the MSA recursively splits the array into subarrays until the subarray size is < 2, merging those subarrays to produce a sorted array by using a new function merge. The back copying is blocked by alternating the direction of the merge with each recursion. For more information see: https://en.wikipedia.org/wiki/Merge_sort\n\nArguments\n\narray::Array{Int64,1}: Unsorted array of integers\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [64, 34, 25, 12, 22, 11, 90]\njulia> ClassicAlgorithmsCollections.merge_sorting(arr)\n[11, 12, 22, 25, 34, 64, 90]\n\n\n\n\n\n","category":"function"},{"location":"man/SortingAndSearching/#ClassicAlgorithmsCollections.quick_sorting","page":"Sorting and Searching","title":"ClassicAlgorithmsCollections.quick_sorting","text":"quick_sorting(array::Array{Int64,1}, low = nothing, high = nothing)\n\nThe quick sort algorithm (QSA) works by selecting a pivot element from the array and partitioning the other elements into two subarrays, according to whether they are less than or greater than the pivot-window. Then the sorting of subarrays is recursively organized. This procedure repeatedly happens until each subarray is organized; consequently, the subarrays' merging is an organized array. For more information see: https://en.wikipedia.org/wiki/Quicksort#Parallelization\n\nArguments\n\narray::Array{Int64,1}: Unsorted array of integers\nlow::Int64: Lowest index of the unsorted array or subarray\nhigh::Int64: Highes index of the unsorted array or subarray\n\nExamples\n\njulia> import ClassicAlgorithmsCollections\njulia> arr = [64, 34, 25, 12, 22, 11, 90]\njulia> ClassicAlgorithmsCollections.quick_sorting(arr)\n[11, 12, 22, 25, 34, 64, 90]\n\n\n\n\n\n","category":"function"}]
}
