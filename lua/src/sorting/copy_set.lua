return function (set)
  local copy = {}
  for _, v in pairs(set) do
    table.insert(copy, v)
  end
  return copy
end
