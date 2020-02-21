--[[
Conceptually, a merge sort works as follows:
Divide the unsorted list into n sublists, each containing 1 element (a list of
1 element is considered sorted).
Repeatedly merge sublists to produce new sorted sublists until there is only 1
sublist remaining. This will be the sorted list.
]]

describe('merge sort', function()
  local merge_sort = require 'src/sorting/merge_sort'

  it('should not modify the original object', function()
    local obj = { 3, 1, 5 }
    merge_sort.ascending(obj)
    assert.are.same({ 3, 1, 5 }, obj)
  end)

  it('should return the original set if set is only one number', function()
    assert.are.same({ 4 }, merge_sort.ascending({ 4 }))
  end)

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, merge_sort.ascending({ 2, 1 }))
  end)

  it('should return a two number set if the set is already in order', function()
    assert.are.same({ 1, 2 }, merge_sort.ascending({ 1, 2 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ -1, 1, 2 }, merge_sort.ascending({ 1, -1, 2 }))
  end)

  it('should sort a set of numbers in ascending order', function()
    assert.are.same({ -3, -2, 0, 4, 5 }, merge_sort.ascending({ 4, -3, 0, -2, 5}))
  end)

  it('should sort a larger set of numbers in ascending order', function()
    assert.are.same({ 1, 2, 3, 4, 5, 6, 7 }, merge_sort.ascending({ 7, 6, 5, 4, 3, 2, 1 }))
  end)
end)
