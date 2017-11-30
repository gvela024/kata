--[[
Conceptually, a merge sort works as follows:
Divide the unsorted list into n sublists, each containing 1 element (a list of
1 element is considered sorted).
Repeatedly merge sublists to produce new sorted sublists until there is only 1
sublist remaining. This will be the sorted list.
]]

describe('merge sort', function()
  local merge_sort = require 'src/sorting/merge_sort'

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, merge_sort.ascending({ 2, 1 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ -1, 1, 2 }, merge_sort.ascending({ 1, -1, 2 }))
  end)
  
  -- it('should sort a set of numbers in ascending order', function()
  --   assert.are.same({ -3, -3, -2.2, 0, 4, 4.9, 4.9, 7, 10 }, merge_sort.ascending({ 10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3 }))
  -- end)
  --
  -- it('should not modify the original set', function()
  --   local actual = { 4, 2, 3, 1 }
  --   merge_sort.descending(actual)
  --   assert.are.same({ 4, 2, 3, 1 }, actual)
  -- end)
  --
  -- it('should sort two numbers in descending order', function()
  --   assert.are.same({ 2, 1 }, merge_sort.descending({ 2, 1 }))
  -- end)
  --
  -- it('should sort three numbers in descending order', function()
  --   assert.are.same({ 2, 1, -1 }, merge_sort.descending({ 1, -1, 2 }))
  -- end)
  --
  -- it('should sort a set of numbers in descending order', function()
  --   assert.are.same({ 10, 7, 4.9, 4.9, 4, 0, -2.2, -3, -3 }, merge_sort.descending({ 10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3 }))
  -- end)
end)
