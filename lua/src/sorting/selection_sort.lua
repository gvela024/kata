local function copySet(set)
  local copy = {}
  for _, v in pairs(set) do
    table.insert(copy, v)
  end
  return copy
end

local function selection_sort(set, order)
  local set_copy = copySet(set)
  local ordered = {}

  for _ in pairs(set) do
    local smallest, key
    for k, v in pairs(set_copy) do
      if smallest == nil or smallest > v then
        key = k
        smallest = v
      end
    end

    table.remove(set_copy, key)
    if order then
      table.insert(ordered, order, smallest)
    else
      table.insert(ordered, smallest)
    end
  end

  return ordered
end

local function ascending(set)
  return selection_sort(set)
end

local function descending(set)
  return selection_sort(set, 1)
end

return {
  ascending = ascending,
  descending = descending
}
