# This file is for programming set #1, in MTH 325
# We are writing two functions. One function will determine the degree of a given vertex.
# The other function will take a degree sequence and determine if the degree sequence represents a
# valid tree. All code written here is that of my own.

# The first function must follow the following guidelines:
# degree_sequence: This function takes a graph (represented by a dictionary)
# as input and outputs the degree sequence of the graph as a list (in non-increasing order).

# An example is shown below:
# degree_sequence({"A": ["B", "C"], "B":["A", "C"], "C":["A", "B", "D"], "D": ["C"]})
# should return [3,2,2,1]


def degree_sequence(dict):
    list = []
    for vert in dict:
        list.append(len(dict[vert]))
        list.sort()
        list.reverse()

    return list


verts = {"A": ["B", "C"], "B": ["A", "C"], "C": ["A", "B", "D"], "D": ["C"]}
# Should return [3,2,2,1]

verts2 = {"A": ["B", "C"], "B": ["A", "C"], "C": ["A", "B"]}
# Should return [2,2,2]

verts3 = {"A": ["B", "C", "D"], "B": ["A", "C", "F"], "C": ["A", "B", "D", "E", "F"], "D": ["A", "E", "D"],
          "E": ["F", "C", "D", "G"], "F": ["B", "C", "E", "G"], "G": ["F", "E"]}
# Should return [5,4,4,3,3,3,2]

print(degree_sequence(verts))
print(degree_sequence(verts2))
print(degree_sequence(verts3))


# The second function must follow the following guidelines:
# Havel_Hakimi: This function takes a list of non-increasing integers as input and determines
# whether or not this is the degree sequence of a graph.

# An example of the second function is shown below:
# Havel_Hakimi([3,3,3,3,3]) should return False
# Havel_Hakimi([3,3,2,2,2,2]) should return True


def Havel_Hakimi(nums):
    answer = False
    i = 0
    deg_sum = 0

    # Checks for a single vertex sequence with degree greater than 1
    if len(nums) < 2:
        if nums[0] == 1:
            return True
        else:
            return answer
    # Checks for negative number in sequence, if no negatives, adds sum
    for x in nums:
        if nums[i] < 0:
            return answer
        else:
            deg_sum += nums[i]
            i += 1

    # Reset i for loop purposes
    i = 0
    # Base recursive case, if sum of the degree sequence is 0
    if deg_sum == 0:
        return True
    else:
        # Removes first satisfied vertex
        nums = nums[1:len(nums)]
        # Runs loop decreasing remaining vertices by 1, also incrementing i
        for x in nums:
            if nums[i] > 0:
                nums[i] -= 1
            i += 1

        # Increments last vertex, resets i value for loop
        nums[len(nums) - 1] += 1
        i = 0
        # Checks for a negative vertex through looping and i movement
        for x in nums:
            if nums[i] < 0:
                return False
            i += 1

        i = len(nums) - 1
        while i >= 0:
            if nums[i] == 0:
                nums.remove(0)
            i -= 1

        # Sorts in reverse and runs again
        nums.sort()
        nums.reverse()

        return Havel_Hakimi(nums)


Havel1 = [3, 3, 3, 3, 3]
# Should return false
Havel2 = [3, 3, 2, 2, 2, 2]
# Should return true
Havel3 = [3, 3, 2, 2]
# Should return true
Havel4 = [3, 3]
# Should return false
Havel5 = [5, 5, 3, 3, 2, 2, 2]
# Should return true

print(Havel_Hakimi(Havel1))
print(Havel_Hakimi(Havel2))
print(Havel_Hakimi(Havel3))
print(Havel_Hakimi(Havel4))
print(Havel_Hakimi(Havel5))
