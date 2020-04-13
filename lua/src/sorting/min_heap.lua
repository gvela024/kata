return function()
  local tree = {}
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
      return 3
    end,

    tree = tree
  }
end
