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

local function min_heap_insert(tree, node)
  table.insert(tree, node)
  local parent_index = math.floor(#tree / 2)
  local node_index = #tree
  while parent_index > 0 and tree[parent_index].frequency > node.frequency do
    local parent_value = tree[parent_index]
    tree[parent_index] = node
    tree[node_index] = parent_value
    node_index = parent_index
    parent_index = math.floor(node_index / 2)
  end
end

local function build_min_heap_priority_queue(unordered_map, priority_queue)
  for character, frequency in pairs(unordered_map) do
    local node = { character = character, frequency = frequency }
    min_heap_insert(priority_queue, node)
  end
end

local function make_copy(source, destination)
  for k, v in ipairs(source) do table.insert(destination, k, v) end
end

local function swap(i1, i2, tree)
  local temp = tree[i1]
  tree[i1] = tree[i2]
  tree[i2] = temp
end

local function get_minimum(tree)
  minimum = tree[1]
  tree[1] = tree[#tree]
  tree[#tree] = nil
  -- table.remove(tree)
  local sorting_index = 1
  while sorting_index < #tree do
    local left_value, left_index = heap_utilities.get_left_child(sorting_index, tree)
    local right_value, right_index = heap_utilities.get_right_child(sorting_index, tree)

    if left_value and left_value.frequency < tree[sorting_index].frequency then
      swap(left_index, sorting_index, tree)
      sorting_index = left_index
    elseif right_value and right_value.frequency < tree[sorting_index].frequency then
      swap(right_index, sorting_index, tree)
      sorting_index = right_index
    else
      break
    end
  end

  return minimum
end

local function build_huffman_tree(priority_queue, huffman_tree)
  make_copy(priority_queue, huffman_tree)

  while #huffman_tree > 1 do
    local minimum_1 = get_minimum(huffman_tree)
    local minimum_2 = get_minimum(huffman_tree)

    local node = {
      frequency = minimum_1.frequency + minimum_2.frequency,
      right = minimum_1,
      left = minimum_2
    }
    min_heap_insert(huffman_tree, node)
  end
end

local function build_huffman_codes(huffman_tree, code, huffman_codes)
  -- print()
  -- print('code', code)
  if huffman_tree == nil then
    -- print()
    -- for k, v in pairs(huffman_codes) do print (k, v) end
    return
  end

  local left = huffman_tree.left
  local right = huffman_tree.right

  if left == nil and right == nil then
    huffman_codes[huffman_tree.character] = code
  end

  build_huffman_codes(left, code .. '0', huffman_codes)
  build_huffman_codes(right, code .. '1', huffman_codes)
end

return function()
  local unordered_map = {}
  local priority_queue = {}
  local huffman_tree = {}
  local huffman_codes = {}

  return function(text)
    build_unordered_map(text, unordered_map)
    build_min_heap_priority_queue(unordered_map, priority_queue)
    build_huffman_tree(priority_queue, huffman_tree)
    build_huffman_codes(huffman_tree[1], '', huffman_codes)

    return {
      unordered_map = unordered_map,
      priority_queue = priority_queue,
      tree = huffman_tree,
      codes = huffman_codes
    }
end
end
