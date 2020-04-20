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
    end
  }
end
