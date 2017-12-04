import math
"""
17  16  15  14  13
18   5   4   3  12
19   6   1   2  11
20   7   8   9  10
21  22  23---> ...
"""
def main():
    spiral = [1]
    current_val = 0
    print([get_coords(x) for x in range(1,20)])

def find_depth(val):
    return math.ceil(.5 * (-1+math.sqrt(val)))

def get_coords(index):
    depth = find_depth(index)
    return (math.floor(find_edge_length(depth)/2), find_length_to_middle(index, depth))

def find_length_to_middle(index, depth):
    el = find_edge_length(depth)
    max_val = find_max_value(depth)
    middle_points = [
        math.ceil(max_val - (el/2)),
        math.ceil(max_val - (el/2) - (el-1)),
        math.ceil(max_val - (el/2) - (el-1)*2),
        math.ceil(max_val - (el/2) - (el-1)*3)
    ]
    middle_points = [(abs(index - x), index - x) for x in middle_points]
    return min(middle_points, key=lambda y: y[0])[1]



def find_edge_length(depth):
    return depth * 2 + 1

def find_max_value(depth):
    return 8 * ((math.pow(depth, 2) + depth) / 2) + 1

def find_min_value(depth):
    return find_max_value(depth) - (4 * (find_edge_length(depth) - 1)) + 1



if __name__ == '__main__':
    main()
