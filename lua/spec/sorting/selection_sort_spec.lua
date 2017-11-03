--[[
The algorithm divides the input list into two parts: the sublist of items
already sorted, which is built up from left to right at the front (left)
of the list, and the sublist of items remaining to be sorted that occupy
the rest of the list. Initially, the sorted sublist is empty and the unsorted
sublist is the entire input list. The algorithm proceeds by finding the
smallest (or largest, depending on sorting order) element in the unsorted
sublist, exchanging (swapping) it with the leftmost unsorted element
(putting it in sorted order), and moving the sublist boundaries one element
to the right.

Example
64 25 12 22 11 // this is the initial, starting state of the array
11 25 12 22 64 // sorted sublist = {11}
11 12 25 22 64 // sorted sublist = {11, 12}
11 12 22 25 64 // sorted sublist = {11, 12, 22}
11 12 22 25 64 // sorted sublist = {11, 12, 22, 25}
11 12 22 25 64 // sorted sublist = {11, 12, 22, 25, 64}
]]

describe('bubble sort', function()
  local selection_sort = require 'src/sorting/selection_sort'

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, selection_sort.ascending({ 2, 1 }))
  end)

  -- it('should sort three numbers in ascending order', function()
  --   assert.are.same({ -1, 1, 2 }, selection_sort.ascending({ 1, -1, 2 }))
  -- end)
  --
  -- it('should sort a set of numbers in ascending order', function()
  --   assert.are.same({ -3, -3, -2.2, 0, 4, 4.9, 4.9, 7, 10 }, selection_sort.ascending({ 10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3 }))
  -- end)
  --
  -- it('should not modify the original set', function()
  --   local actual = { 4, 2, 3, 1 }
  --   selection_sort.descending(actual)
  --   assert.are.same({ 4, 2, 3, 1 }, actual)
  -- end)
  --
  -- it('should sort two numbers in descending order', function()
  --   assert.are.same({ 2, 1 }, selection_sort.descending({ 2, 1 }))
  -- end)
  --
  -- it('should sort three numbers in descending order', function()
  --   assert.are.same({ 2, 1, -1 }, selection_sort.descending({ 1, -1, 2 }))
  -- end)
  --
  -- it('should sort a set of numbers in descending order', function()
  --   assert.are.same({ 10, 7, 4.9, 4.9, 4, 0, -2.2, -3, -3 }, selection_sort.descending({ 10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3 }))
  -- end)
end)
