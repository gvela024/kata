local copy_set = require 'src.sorting.copy_set'

local function bucket_sort(set, number_of_buckets)
  local buckets = {}

  for i = 1, number_of_buckets do
    table.insert(buckets, {})
  end

  local max_value = 0
  for _, v in ipairs(set) do
    if v > max_value then
      max_value = v
    end
  end

  for _, v in ipairs(set) do
    local bucket_index = math.floor((v * number_of_buckets) / max_value)
    table.insert(buckets[bucket_index], v)
  end

  set = {}
  for _, bucket in ipairs(buckets) do
    if #bucket > 0 then
      for _, v in ipairs(bucket) do
        table.insert(set, v)
      end
    end
  end

  return set
end

local function ascending(_set)
  local set = copy_set(_set)
  -- Note that the number of empty buckets will change with the expected range of numbers in the set to be sorted
  set = bucket_sort(set, 10)
  return set
end

return {
  ascending = ascending
}
