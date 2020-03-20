--[[
1) Create an array of n empty buckets
2) Do following for every array element arr[i].
  a) Insert arr[i] into bucket[ n*array[i] ]
3) Sort individual buckets using insertion sort.
4) Concatenate all sorted buckets.

Negatives are also handled differently.
This is more faster on an evenly distributed data set
The slowest part is the sorting of each individual bucket
]]

describe('bucket sort', function()
  local bucket_sort = require 'src.sorting.bucket_sort'

  it('should not modify the original object', function()
    local obj = { 3, 1, 5 }
    bucket_sort.ascending(obj)
    assert.are.same({ 3, 1, 5 }, obj)
  end)

  it('should return the original set if set is only one number', function()
    assert.are.same({ 4 }, bucket_sort.ascending({ 4 }))
  end)

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, bucket_sort.ascending({ 2, 1 }))
  end)

  it('should return a two number set if the set is already in order', function()
    assert.are.same({ 1, 2 }, bucket_sort.ascending({ 1, 2 }))
  end)

  it('should return a two number set has two equal numbers', function()
    assert.are.same({ 1, 1 }, bucket_sort.ascending({ 1, 1 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ 1, 2, 3 }, bucket_sort.ascending({ 3, 1, 2 }))
  end)

  it('should sort a set of numbers in ascending order', function()
    assert.are.same({ 0.1, 0.2, 0.3, 0.4, 0.7 }, bucket_sort.ascending({ 0.4, 0.3, 0.1, 0.2, 0.7 }))
  end)

  it('should sort a larger set of numbers in ascending order', function()
    assert.are.same({ 1, 2, 2, 3, 4, 6, 7 }, bucket_sort.ascending({ 7, 6, 2, 4, 3, 2, 1 }))
  end)
end)
