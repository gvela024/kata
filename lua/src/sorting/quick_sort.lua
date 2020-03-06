local copy_set = require 'src.sorting.copy_set'

local function swap(set, index_1, index_2)
  local temp = set[index_1]
  set[index_1] = set[index_2]
  set[index_2] = temp
end

local function partition(set, low, high)
  local pivot = set[high]

  local low_element_swap_index = low - 1
  for high_element_swap_index = low, (high - 1) do
    if set[high_element_swap_index] <= pivot then
      low_element_swap_index = low_element_swap_index + 1
      swap(set, low_element_swap_index, high_element_swap_index)
    end
  end

  swap(set, low_element_swap_index + 1, high)
  return low_element_swap_index + 1
end

local function quick_sort(set, low, high)
  if low < high then
    local partition_index = partition(set, low, high)

    quick_sort(set, low, partition_index - 1)
    quick_sort(set, partition_index, high)
  else
  end
end

local function ascending(_set)
  local set = copy_set(_set)
  quick_sort(set, 1, #set)
  return set
end

return {
  ascending = ascending
}
