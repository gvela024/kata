local heap_util = require 'src/sorting/heap_utilities'

return function()
  local tree = {}

  return {
    tree = tree,

    insert = function(nodes)
      for _, node in ipairs(nodes) do
        table.insert(tree, node)
        local parent_index = math.floor(#tree / 2)
        local node_index = #tree
        while parent_index > 0 and node > tree[parent_index] do
          local parent_value = tree[parent_index]
          tree[parent_index] = node
          tree[node_index] = parent_value
          node_index = parent_index
          parent_index = math.floor(node_index / 2)
        end
      end
    end,

    get_maximum = function()
      local max_value = tree[1]
      tree[1] = tree[#tree]
      tree[#tree] = nil

      local last_index = 1
      local last_value = tree[1]
      local left_child_value, left_child_index = heap_util.get_left_child(last_index, tree)
      local right_child_value, right_child_index = heap_util.get_right_child(last_index, tree)
      while left_child_value and last_index < left_child_value or right_child_value and last_index < right_child_value do
        local larger_child_index = left_child_value > right_child_value and left_child_index or right_child_index
        local larger_child_value = left_child_value > right_child_value and left_child_value or right_child_value

        tree[larger_child_index] = last_value
        tree[last_index] = larger_child_value

        last_index = larger_child_index
        left_child_value, left_child_index = heap_util.get_left_child(last_index, tree)
        right_child_value, right_child_index = heap_util.get_right_child(last_index, tree)
      end

      return max_value
    end
  }
end
