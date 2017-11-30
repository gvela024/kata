local function copySet(set)
  local copy = {}
  for _, v in pairs(set) do
    table.insert(copy, v)
  end
  return copy
end

local function merge(set, left, middle, right)
  print('merge')
  print(left, middle, right)
end

local function merge_sort(set, left, right)
  if right > left then
    local middle = math.floor(left + (right - left) / 2)
    print('left: ', left)
    print('middle: ', middle)
    print('right: ', right)

    merge_sort(set, left, middle)
    merge_sort(set, middle + 1, right)

    merge(set, left, middle, right)
  end
end

local function ascending(set)
  local setCopy = copySet(set)
  merge_sort(setCopy, 1, #setCopy)
  return { 1, 2 }
end

return {
  ascending = ascending
}
