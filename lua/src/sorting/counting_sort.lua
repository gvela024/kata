local copy_set = require 'src.sorting.copy_set'

local function counting_sort(set)

  -- the next 3 loops could probably be combined
  local max = 0
  for _, x in ipairs(set) do
    if x > max then max = x end
  end

  local count = {}
  for i = 1, max do
    count[i] = 0
  end

  for _, x in ipairs(set) do
    count[x] = count[x] + 1
  end

  local total = 0
  for i = 2, max do
    count[i] = count[i] + count[i - 1]
  end

  local output = {}
  for _, x in ipairs(set) do
    output[count[x]] = x
    -- table.insert(output, count[x], x)
    count[x] = count[x] - 1
  end

  return output
end

local function ascending(_set)
  return counting_sort(_set)
end

return {
  ascending = ascending
}
