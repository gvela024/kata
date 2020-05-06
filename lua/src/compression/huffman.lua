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

local function build_max_heap_priority_queue(unordered_map, priority_queue)
  for character, frequency in pairs(unordered_map) do
    local node_value = { character = character, frequency = frequency }
    table.insert(priority_queue, node_value)
    local parent_index = math.floor(#priority_queue / 2)
    local node_index = #priority_queue
    while parent_index > 0 and priority_queue[parent_index].frequency > frequency do
      local parent_value = priority_queue[parent_index]
      priority_queue[parent_index] = node_value
      priority_queue[node_index] = parent_value
      node_index = parent_index
      parent_index = math.floor(node_index / 2)
    end
  end
end

local function make_copy(set)
  local copy = {}
  for k in ipairs(set) do
    table.insert(copy, set[k])
  end
  return copy
end

local function get_minimum(tree)
  local minimum = tree[1]
  local last_value = tree[#tree]
  local last_index = 1
  local left_child_value, left_child_index = heap_utilities.get_left_child(last_index, tree)
  local right_child_value, right_child_index = heap_utilities.get_right_child(last_index, tree)

  tree[#tree] = nil

  while left_child_value and last_value.frequency > left_child_value.frequency or right_child_value and last_value.frequency > right_child_value.frequency do
    local smaller_child_index = left_child_value.frequency > right_child_value.frequency and right_child_index or left_child_index
    local smaller_child_value = left_child_value.frequency > right_child_value.frequency and right_child_value or left_child_value
    tree[last_index] = smaller_child_value
    tree[smaller_child_index] = last_value

    last_index = smaller_child_index
    left_child_value, left_child_index = heap_utilities.get_left_child(last_index, tree)
    right_child_value, right_child_index = heap_utilities.get_right_child(last_index, tree)
  end
  return minimum
end

local function build_huffman_tree(priority_queue, huffman_tree)
  local priority_queue_copy = make_copy(priority_queue)
  local minimum_1 = get_minimum(priority_queue_copy)
  local minimum_2 = get_minimum(priority_queue_copy)
  table.insert(huffman_tree, 1, minimum_1)
  table.insert(huffman_tree, 1, minimum_2)
  table.insert(huffman_tree, 1, { frequency = minimum_1.frequency + minimum_2.frequency })
  while #priority_queue_copy > 1 do
    minimum_1 = get_minimum(priority_queue_copy)
    minimum_2 = get_minimum(priority_queue_copy)
    table.insert(huffman_tree, 1, minimum_1)
    table.insert(huffman_tree, 1, minimum_2)
    table.insert(huffman_tree, 1, { frequency = minimum_1.frequency + minimum_2.frequency })
  end
  local root = huffman_tree[1]
  local minimum = get_minimum(priority_queue_copy)
  table.insert(huffman_tree, 1, root)
  table.insert(huffman_tree, 1, { frequence = root.frequency + minimum.frequency })
end

-- local function build_huffman_codes(priority_queue, node_index, code, huffman_codes)
--   if node_index > #priority_queue then return end

--   local left_child_value, left_child_index = heap_utilities.get_left_child(node_index, priority_queue)
--   local right_child_value, right_child_index = heap_utilities.get_right_child(node_index, priority_queue)

--   if left_child_value == nil and right_child_value == nil then huffman_codes[priority_queue[node_index].character] = code end

--   build_huffman_codes(priority_queue, left_child_index, code .. '0', huffman_codes)
--   build_huffman_codes(priority_queue, right_child_index, code .. '1', huffman_codes)
-- end

return function(text)
  local codes = {}
  local unordered_map = {}
  local priority_queue = {}
  local huffman_tree = {}
  local huffman_codes = {}

  build_unordered_map(text, unordered_map)
  build_max_heap_priority_queue(unordered_map, priority_queue)
  build_huffman_tree(priority_queue, huffman_tree)
  -- build_huffman_codes(priority_queue, 1, '', huffman_codes)

  return {
    codes = codes,
    unordered_map = unordered_map,
    priority_queue = priority_queue,
    huffman_codes = huffman_codes
  }
end
