local function build_unordered_map(text, unordered_map)
  for c in text:gmatch"." do
    if unordered_map[c] then
      unordered_map[c] = unordered_map[c] + 1
    else
      unordered_map[c] = 1
    end
  end
end

local function build_priority_queue(unordered_map, priority_queue)
  for character, frequency in pairs(unordered_map) do
    local node_value = { character = character, frequency = frequency }
    table.insert(priority_queue, node_value)
    local parent_index = math.floor(#priority_queue / 2)
    local node_index = #priority_queue
    while parent_index > 0 and priority_queue[parent_index].frequency < frequency do
      local parent_value = priority_queue[parent_index]
      priority_queue[parent_index] = node_value
      priority_queue[node_index] = parent_value
      node_index = parent_index
      parent_index = math.floor(node_index / 2)
    end
  end
end

return function(text)
  local codes = {}
  local unordered_map = {}
  local priority_queue = {}

  build_unordered_map(text, unordered_map)
  build_priority_queue(unordered_map, priority_queue)

  return {
    codes = codes,
    unordered_map = unordered_map,
    priority_queue = priority_queue
  }
end
