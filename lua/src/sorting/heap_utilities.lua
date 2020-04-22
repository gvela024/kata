return {
  get_left_child = function(parent_index, tree)
    return tree[parent_index * 2], parent_index * 2
  end,

  get_right_child = function(parent_index, tree)
    return tree[(parent_index * 2) + 1], (parent_index * 2) + 1
  end
}
