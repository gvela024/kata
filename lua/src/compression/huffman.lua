local heap_utilities = require 'src.sorting.heap_utilities'

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

local function build_huffman_codes(priority_queue, node_index, code, huffman_codes)
  print()
  print(node_index)

  if node_index > #priority_queue then return end

  local left_child_value, left_child_index = heap_utilities.get_left_child(node_index, priority_queue)
  local right_child_value, right_child_index = heap_utilities.get_right_child(node_index, priority_queue)

  print(left_child_value, right_child_value)
  print(left_child_index, right_child_index)
  -- for k, v in pairs(left_child_value) do print(k, v) end

  if left_child_value == nil and right_child_value == nil then huffman_codes[priority_queue[node_index].character] = code end

  build_huffman_codes(priority_queue, left_child_index, code .. '0', huffman_codes)
  build_huffman_codes(priority_queue, right_child_index, code .. '1', huffman_codes)
end

return function(text)
  local codes = {}
  local unordered_map = {}
  local priority_queue = {}
  local huffman_codes = {}

  build_unordered_map(text, unordered_map)
  build_priority_queue(unordered_map, priority_queue)
  build_huffman_codes(priority_queue, 1, '', huffman_codes)

  return {
    codes = codes,
    unordered_map = unordered_map,
    priority_queue = priority_queue,
    huffman_codes = huffman_codes
  }
end
