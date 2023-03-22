
def combine_trees(tree1_string, tree2_string, dist1=0.8, dist2=0.8):
    tree1_stripped = tree1_string.replace(';', '')
    tree2_stripped = tree2_string.replace(';', '')
    return f"({tree1_stripped}:{dist1},\n{tree2_stripped}:{dist2})"

def filename(family_name):
    return f"data/wzy/seed-cazy-search/seeds-in-families/{family_name}.ph"

def get_tree_string_from_file(family_name):
    input_filename = filename(family_name)
    with open(input_filename, 'r') as infile:
        tree_string = infile.read()
    return tree_string

AB = combine_trees(get_tree_string_from_file('x614'), get_tree_string_from_file('x609'))
CD = combine_trees(get_tree_string_from_file('x607'), get_tree_string_from_file('x613'))
EF = combine_trees(get_tree_string_from_file('x605'), get_tree_string_from_file('x617'))
GH = combine_trees(get_tree_string_from_file('x610'), get_tree_string_from_file('x612'))
IJ = combine_trees(get_tree_string_from_file('x606'), get_tree_string_from_file('x611'))
ABCD = combine_trees(AB, CD, dist1=0, dist2=0)
EFGH = combine_trees(EF, GH, dist1=0, dist2=0)
IJK = combine_trees(IJ, get_tree_string_from_file('x608'), dist1=0, dist2=0.8)
ABCDEFGH = combine_trees(ABCD, EFGH, dist1=0, dist2=0)
ABCDEFGHIJK = combine_trees(ABCDEFGH, IJK, dist1=0, dist2=0)

with open("combined-tree.nwk", "w") as outfile:
    outfile.write(f"{ABCDEFGHIJK};")