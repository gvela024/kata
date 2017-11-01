local function make_copy(set)
  local _set = {}
  for i = 1, #set do
    table.insert(_set, set[i])
  end
  return _set
end

local function ascending(set)
  local copy = make_copy(set)

  for k in ipairs(set) do
    for w, v in ipairs(copy) do
      if w > 1 and copy[w - 1] > copy[w] then
        local temp = copy[w - 1]
        copy[w - 1] = copy[w]
        copy[w] = temp
      end
    end
  end

  return copy
end

return {
  ascending = ascending
}
