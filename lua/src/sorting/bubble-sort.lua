local function make_copy(set)
  local _set = {}
  for i = 1, #set do
    table.insert(_set, set[i])
  end
  return _set
end

local function ascending(set)
  local copy = make_copy(set)

  for _ = 0, #copy do
    for i = 2, #copy do
      if copy[i] < copy[i - 1] then
        local temp = copy[i - 1]
        copy[i - 1] = copy[i]
        copy[i] = temp
      end
    end
  end

  return copy
end

return {
  ascending = ascending
}
