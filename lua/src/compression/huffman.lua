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
  if huffman_tree == nil then
    return
  end

  local left = huffman_tree.left
  local right = huffman_tree.right

  if left == nil and right == nil then
    huffman_codes[huffman_tree.character] = code
  end

  build_huffman_codes(right, code .. '0', huffman_codes)
  build_huffman_codes(left, code .. '1', huffman_codes)
end

local function encoded_string(huffman_codes, text)
  local encoded_string = ''
  for c in text:gmatch'.' do
    encoded_string = encoded_string .. huffman_codes[c]
  end
  return encoded_string
end

local function decode(huffman_tree, encoded_text_array, decode_data)
  if huffman_tree == nil then return end

  if huffman_tree.left == nil and huffman_tree.right == nil then
    table.insert(decode_data.string, huffman_tree.character)
    return
  end

  decode_data.index = decode_data.index + 1

  if encoded_text_array[decode_data.index] == '0' then decode(huffman_tree.right, encoded_text_array, decode_data)
  else decode(huffman_tree.left, encoded_text_array, decode_data) end
end

local function decode_string(huffman_tree, text)
  local encoded_text_array = {}
  text:gsub('.', function(c) table.insert(encoded_text_array, c) end)

  local decode_data = { }
  decode_data.string = { }
  decode_data.index = 0
  while decode_data.index < #text do decode(huffman_tree, encoded_text_array, decode_data) end

  local decoded_string = ''
  for _, c in ipairs(decode_data.string) do decoded_string = decoded_string .. c end
  return decoded_string
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

    local encoded_string = encoded_string(huffman_codes, text)
    local decoded_string = decode_string(huffman_tree[1], encoded_string)

    return {
      unordered_map = unordered_map,
      priority_queue = priority_queue,
      tree = huffman_tree,
      codes = huffman_codes,
      encoded_string = encoded_string,
      decoded_string = decoded_string
    }
end
end
