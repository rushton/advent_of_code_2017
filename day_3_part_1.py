import math

def main():
    for val in [1,12,23,1024,265149]:
        depth = find_depth(val)
        print(
            val,
            depth,
            find_edge_length(depth),
            find_max_value(depth),
            find_min_value(depth),
            find_length_to_middle(val, depth)  + math.floor(find_edge_length(depth)/2)
        )

def find_length_to_middle(val, depth):
    el = find_edge_length(depth)
    max_val = find_max_value(depth)
    middle_points = [
        math.ceil(max_val - (el/2)),
        math.ceil(max_val - (el/2) - (el-1)),
        math.ceil(max_val - (el/2) - (el-1)*2),
        math.ceil(max_val - (el/2) - (el-1)*3)
    ]
    return min([abs(val - x) for x in middle_points])

def find_depth(val):
    return math.ceil(.5 * (-1+math.sqrt(val)))

def find_edge_length(depth):
    return depth * 2 + 1

def find_max_value(depth):
    return 8 * ((math.pow(depth, 2) + depth) / 2) + 1

def find_min_value(depth):
    return find_max_value(depth) - (4 * (find_edge_length(depth) - 1)) + 1

if __name__ == '__main__':
    main()
