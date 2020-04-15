
return function()
  local tree = {}

  local get_left_child = function(parent_index)
    return tree[parent_index * 2], parent_index * 2
  end

  local get_right_child = function(parent_index)
    return tree[(parent_index * 2) + 1], (parent_index * 2) + 1
  end

  return {
    insert = function(values)
      for _, value in ipairs(values) do
        table.insert(tree, value)
        local parent_index = math.floor(#tree / 2)
        local node_index = #tree
        while parent_index > 0 and tree[parent_index] > value do
          local parent_value = tree[parent_index]
          tree[parent_index] = value
          tree[node_index] = parent_value
          node_index = parent_index
          parent_index = math.floor(parent_index / 2)
        end
      end
    end,

    get_minimum = function()
      local minimum = tree[1]
      local last_value = tree[#tree]
      local last_index = 1
      local left_child_value, left_child_index = get_left_child(last_index)
      local right_child_value, right_child_index = get_right_child(last_index)

      tree[#tree] = nil

      while left_child_value and last_value > left_child_value or right_child_value and last_value > right_child_value do
        local smaller_child_index = left_child_value > right_child_value and right_child_index or left_child_index
        local smaller_child_value = left_child_value > right_child_value and right_child_value or left_child_value
        tree[last_index] = smaller_child_value
        tree[smaller_child_index] = last_value

        last_index = smaller_child_index
        left_child_value, left_child_index = get_left_child(last_index)
        right_child_value, right_child_index = get_right_child(last_index)
      end
      return minimum
    end,

    tree = tree
  }
end
