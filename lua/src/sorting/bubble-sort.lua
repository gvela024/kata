local function make_copy(set)
  local _set = {}
  for i = 1, #set do
    table.insert(_set, set[i])
  end
  return _set
end

local function ascending(set)
  local copy = make_copy(set)

  local previous = nil
  for k, v in ipairs(set) do
    if previous and previous > v then
      local temp = copy[k - 1]
      copy[k - 1] = v
      copy[k] = temp
    else
      previous = v
    end
  end

  return copy
end

return {
  ascending = ascending
}
