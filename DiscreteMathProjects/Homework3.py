# This file is for programming set #3 in MTH 325
# We are writing two functions. One will be a function
# to return the transitive closure of a digraph. The
# other function will be written to mimic the Floyd-Warshall
# algorithm.

# This first function, when passed a python matrix representing of
# an adjacency matrix will return another matrix that gives the
# transitive closure between ALL pairs of vertices

def Warshall(adjMat):
    # Assign the length of the list of lists to
    # a variable for ease of use
    num_verts = len(adjMat)

    # Creates new matrix so we can alter it and return it
    my_mat = adjMat

    # Nested loops to access/alter each path, producing
    # the transitive closure of my_mat

    for k in range(num_verts):
        # 'i' will represent the first vertex
        for i in range(num_verts):
            # 'j' will represent the second vertex
            for j in range(num_verts):
                # Adjust values
                my_mat[i][j] = my_mat[i][j] or (my_mat[i][k] & my_mat[k][j])

    # Return myMat
    return my_mat


matrix1 = [[1, 1, 0, 1],
           [0, 1, 1, 0],
           [0, 0, 1, 1],
           [0, 0, 0, 1]]
print(Warshall(matrix1))


# This second function, when passed an adjacency matrix, will
# output another matrix representing the shorted weighted path between
# two vertices. This is the Floyd-Warshall algorithm and it is used to find
# the shortest distance between two vertices, whether it be a single edge or two
# edges added together

def Floyd_Warshall(adjMat):
    # Sets a variable to number of
    # vertices for ease of use.
    num_verts = len(adjMat)

    # Creates copy matrix for return/altering
    my_mat = adjMat

    # Nested loop to preset any zeros to 'INF'
    # so that paths with no directed edge
    # will remain 'INF' even after altering
    for vert1 in range(num_verts):
        for vert2 in range(num_verts):
            if my_mat[vert1][vert2] == 0:
                my_mat[vert1][vert2] = float('inf')

    # Nested loops for altering paths to represent the
    # shortest weighted path

    for k in range(num_verts):
        # 'i' is used to represent first vertex
        for i in range(num_verts):
            # 'j' is used to represent second vertex
            for j in range(num_verts):
                # Adjust values, setting to SHORTEST length
                my_mat[i][j] = min(my_mat[i][j], (my_mat[i][k] + my_mat[k][j]))

    return my_mat


matrix2 = [[0, 7, 0, 5],
           [0, 2, 0, 0],
           [0, 3, 0, 4],
           [1, 0, 0, 0]]
print(Floyd_Warshall(matrix2))
