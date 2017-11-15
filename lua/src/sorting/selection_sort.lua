local function copySet(set)
  local copy = {}
  for _, v in pairs(set) do
    table.insert(copy, v)
  end
  return copy
end

local function ascending(set)
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
    table.insert(ordered, smallest)
  end

  return ordered
end

return {
  ascending = ascending
}
