--[[
Sorting based on keys between a specific range.
1. Make an an array where the size of the array is the largets number in the set
2. For each index in array, count the number of instances of the index in the set
3. Modify count array so that each element is the sum of the previous plus current
  - this will result in each unique value being the index of where the values should be put
  the output array
4. For each element in the input, find where it should be put in the output array using the
count array
]]

describe('counting sort', function()
  local counting_sort = require 'src.sorting.counting_sort'

  it('should not modify the original object', function()
    local obj = { 3, 1, 5 }
    counting_sort.ascending(obj)
    assert.are.same({ 3, 1, 5 }, obj)
  end)

  it('should return the original set if set is only one number', function()
    assert.are.same({ 4 }, counting_sort.ascending({ 4 }))
  end)

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, counting_sort.ascending({ 2, 1 }))
  end)

  it('should return a two number set if the set is already in order', function()
    assert.are.same({ 1, 2 }, counting_sort.ascending({ 1, 2 }))
  end)

  it('should return a two number set has two equal numbers', function()
    assert.are.same({ 1, 1 }, counting_sort.ascending({ 1, 1 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ 1, 1, 2, 3, 3 }, counting_sort.ascending({ 1, 3, 1, 2, 3 }))
  end)

  it('should sort a larger set of numbers in ascending order', function()
    assert.are.same({ 1, 2, 2, 3, 4, 6, 7 }, counting_sort.ascending({ 7, 6, 2, 4, 3, 2, 1 }))
  end)
end)
