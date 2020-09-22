# This file is the homework assignment for programming set #2 in MTH 325 at GVSU

# The first function, titled "is_proper", will be passed two inputs: One of a
# graph, and the other a coloring of the vertices. The function determines whether
# or not the coloring is a proper vertex-coloring of the given graph.

# Given examples include:
# is_proper({“A” : [“B”, “C”], “B” : [“A”, “C”], “C” : [“A”, “B”]}, {“A” : 1, “B” : 2, “C” : 3})
# should return True
graph_pairs1 = {"A": ["B", "C"], "B": ["A", "C"], "C": ["A", "B"]}
graph_coloring1 = {"A": 1, "B": 2, "C": 3}

# is_proper({“A” : [“B”, “C”], “B” : [“A”, “C”], “C” : [“A”, “B”]}, {“A” : 1, “B” : 1, “C” : 3})
# should return False
graph_pairs2 = {"A": ["B", "C"], "B": ["A", "C"], "C": ["A", "B"]}
graph_coloring2 = {"A": 1, "B": 1, "C": 3}


def is_proper(graph1, graph2):
    answer = True

    for vert in graph1:
        for x in range(len(graph1[vert])):
            if graph2[vert] == graph2[graph1[vert][x]]:
                return False

    return answer


# These are our test cases for our is_proper function. Going to use the two
# test cases provided then expand and write more if neccessary.
# print(is_proper(graph_pairs1, graph_coloring1))
# print(is_proper(graph_pairs2, graph_coloring2))

# The second function, titled "greedy", takes two inputs: a graph, and an
# ordering of the vertices as a list. The function then returns the proper
# vertex-coloring produced by the greedy algorithm over the ordering in the list

# greedy({“A” : [“B”, “C”], “B” : [“A”], “C” : [“A”]}, [“A”, “B”, “C”])
# should return {“A” : 1, “B” : 2, “C” : 2}
graph_pairs3 = {"A": ["B", "C"], "B": ["A"], "C": ["A"]}
graph_verts3 = ["A", "B", "C", "D"]

# greedy({“A” : [“B”], “B” : [“A”, “C”], “C” : [“B”, “D”], “D” : [“C”]}, [“A”, “D”, “B”, “C”])
# should return {“A” : 1, “B” : 2, “C” : 3, “D” : 1}
graph_pairs4 = {"A": ["B"], "B": ["A", "C"], "C": ["B", "D"], "D": ["C"]}
graph_verts4 = ["A", "B", "C", "D"]


def greedy(graph1, list1):
    # Makes blank dictionary and list for sorted vertices and
    # complete dictionary to return at the end. Also adds
    # color1 to first vertex regardless of list contents.
    # Also adds vertex1 to list of sorted vertices.

    full_dict = {list1[0]: 1}
    sorted_verts = [list1[0]]

    # Loops through vertices in dictionary
    # for vert in graph1:
    #     for x in range(len(graph1[vert])):
    #         # if graph1[vert][x] == graph2[graph1[vert][x]]:
    # for vert in graph1:
    #     x = 0
    #     print(graph1[vert][x])
    #     print(graph1[sorted_verts[x]])
    #     # Iterate through dictionary contents
    #     while x < len(graph1[vert]):
    #         # I am wanting to say, "If the contents of copygraph1 at key VERT are equal to any contents of copygraph1
    #         # at the key of whatever vertex is in sortedVerts, then assign the number Y to the dictionary value"
    #         if graph1[vert][x] in graph1[sorted_verts[x]][x]:
    #             full_dict[vert] = y
    #             y += 1
    #             # Adds to sorted verts so we know which has been colored
    #             sorted_verts.append(vert)
    #         else:  # If not, then assign the vertex the color of the first vertex colored
    #             full_dict[vert] = full_dict[sorted_verts[0]]
    #             # Adds to sorted list so we know which has been colored
    #             sorted_verts.append(vert)
    #         x += 1

    return full_dict


# print(greedy(graph_pairs3, graph_verts3))
print(greedy(graph_pairs4, graph_verts4))
