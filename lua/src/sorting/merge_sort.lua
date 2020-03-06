local copy_set = require 'src.sorting.copy_set'

local function make_subset(set, start, _end)
  local subset = {}
  if start == _end then
    subset[1] = set[start]
  else
    for subset_index = start, _end do
      table.insert(subset, set[subset_index])
    end
  end
  return subset
end

local function merge(set, left_index, middle_index, right_index, frame)
  local left_subset = make_subset(set, left_index, middle_index)
  local right_subset = make_subset(set, middle_index + 1, right_index)

  local left_subset_index = 1
  local right_subset_index = 1
  local set_index = left_index
  while left_subset_index <= #left_subset and right_subset_index <= #right_subset do
    if left_subset[left_subset_index] < right_subset[right_subset_index] then
      set[set_index] = left_subset[left_subset_index]
      left_subset_index = left_subset_index + 1
    else
      set[set_index] = right_subset[right_subset_index]
      right_subset_index = right_subset_index + 1
    end
    set_index = set_index + 1
  end

  while left_subset_index <= #left_subset do
    set[set_index] = left_subset[left_subset_index]
    set_index = set_index + 1
    left_subset_index = left_subset_index + 1
  end

  -- I don't think I'll need this
  -- while right_subset_index <= #right_subset do
  --   set[set_index] = right_subset[right_subset_index]
  --   set_index = set_index + 1
  --   right_subset_index = right_subset_index + 1
  -- end
end

local function merge_sort(set, left_index, right_index, frame, branch)
  if right_index > left_index then
    local middle_index = math.floor((right_index + left_index) / 2)

    merge_sort(set, left_index, middle_index, frame + 1, 'left')
    merge_sort(set, middle_index + 1, right_index, frame + 1, 'right')

    merge(set, left_index, middle_index, right_index, frame + 1)
  end
end

local function ascending(_set)
  if #_set == 1 then
    return _set
  elseif #_set == 2 then
    if _set[2] < _set[1] then
      return { _set[2], _set[1] }
    else
      return _set
    end
  else
    local set = copy_set(_set)
    merge_sort(set, 1, #set, 0, 'start')
    return set
  end
end

return {
  ascending = ascending
}
