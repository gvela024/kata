--[[
Like Merge Sort, QuickSort is a Divide and Conquer algorithm. It picks an
element as pivot and partitions the given array around the picked pivot.
There are many different versions of quickSort that pick pivot in
different ways.

1. Always pick first element as pivot.
2. Always pick last element as pivot.
3. Pick a random element as pivot.
4. Pick median as pivot.

The key process in quickSort is partition(). Target of partitions is, given
an array and an element x of array as pivot, put x at its correct position
in sorted array and put all smaller elements (smaller than x) before x, and
put all greater elements (greater than x) after x. All this should be done
in linear time
]]

describe('quick sort', function()
  local quick_sort = require 'src.sorting.quick_sort'

  it('should not modify the original object', function()
    local obj = { 3, 1, 5 }
    quick_sort.ascending(obj)
    assert.are.same({ 3, 1, 5 }, obj)
  end)

  it('should return the original set if set is only one number', function()
    assert.are.same({ 4 }, quick_sort.ascending({ 4 }))
  end)

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, quick_sort.ascending({ 2, 1 }))
  end)

  it('should return a two number set if the set is already in order', function()
    assert.are.same({ 1, 2 }, quick_sort.ascending({ 1, 2 }))
  end)

  it('should return a two number set has two equal numbers', function()
    assert.are.same({ 1, 1 }, quick_sort.ascending({ 1, 1 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ -1, 1, 2 }, quick_sort.ascending({ 1, -1, 2 }))
  end)

  it('should sort a set of numbers in ascending order', function()
    assert.are.same({ -3, -2, 0, 1, 4 }, quick_sort.ascending({ 4, -3, 0, -2, 1}))
  end)

  it('should sort a larger set of numbers in ascending order', function()
    assert.are.same({ 1, 2, 2, 3, 4, 6, 7 }, quick_sort.ascending({ 7, 6, 2, 4, 3, 2, 1 }))
  end)
end)
