local function make_copy(set)
  local copy = {}
  for k in ipairs(set) do
    table.insert(copy, set[k])
  end
  return copy
end

local function swap_values(set, position1, position2)
  local temp = set[position1]
  set[position1] = set[position2]
  set[position2] = temp
end

local function sort(set, order)
  local copy = make_copy(set)

  for k in ipairs(set) do
    for w, v in ipairs(copy) do
      if w > 1 and order(copy[w - 1], copy[w]) then
        swap_values(copy, w - 1, w)
      end
    end
  end

  return copy
end

local function ascending(set)
  return sort(set, function(value1, value2) return value1 > value2 end)
end

local function descending(set)
  return sort(set, function(value1, value2) return value1 < value2 end)
end

return {
  ascending = ascending,
  descending = descending
}
