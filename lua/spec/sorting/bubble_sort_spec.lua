--[[
Bubble sort, sometimes referred to as sinking sort, is a simple sorting
algorithm that repeatedly steps through the list to be sorted, compares
each pair of adjacent items and swaps them if they are in the wrong order.
The pass through the list is repeated until no swaps are needed, which
indicates that the list is sorted.
]]

describe('bubble sort', function()
  local bubble_sort = require 'src/sorting/bubble_sort'

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, bubble_sort.ascending({ 2, 1 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ -1, 1, 2 }, bubble_sort.ascending({ 1, -1, 2 }))
  end)

  it('should sort a set of numbers in ascending order', function()
    assert.are.same({ -3, -3, -2.2, 0, 4, 4.9, 4.9, 7, 10 }, bubble_sort.ascending({ 10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3 }))
  end)

  it('should not modify the original set', function()
    local actual = { 4, 2, 3, 1 }
    bubble_sort.descending(actual)
    assert.are.same({ 4, 2, 3, 1 }, actual)
  end)

  it('should sort two numbers in descending order', function()
    assert.are.same({ 2, 1 }, bubble_sort.descending({ 2, 1 }))
  end)

  it('should sort three numbers in descending order', function()
    assert.are.same({ 2, 1, -1 }, bubble_sort.descending({ 1, -1, 2 }))
  end)

  it('should sort a set of numbers in descending order', function()
    assert.are.same({ 10, 7, 4.9, 4.9, 4, 0, -2.2, -3, -3 }, bubble_sort.descending({ 10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3 }))
  end)
end)
