--[[-
See `min-heap`, but the largets value is the root
]]

describe('max heap', function()
  local MaxHeap = require 'src.sorting.max_heap'
  local max_heap

  before_each(function()
    max_heap = MaxHeap()
  end)

  it('should return the tree', function()
    assert.are.same({}, max_heap.tree)
  end)

  it('should insert one element', function()
    max_heap.insert({ 1 })
    assert.are.same({ 1 }, max_heap.tree)
  end)

  it('should insert two nodes', function()
    max_heap.insert({ 23, 18 })
    assert.are.same({ 23, 18 }, max_heap.tree)
  end)

  it('should insert three nodes', function()
    max_heap.insert({ 23, 18, 21 })
    assert.are.same({ 23, 18, 21 }, max_heap.tree)
  end)

  it('should insert and sort', function()
    max_heap.insert({ 23, 18, 21, 20 })
    assert.are.same({ 23, 20, 21, 18 }, max_heap.tree)
  end)
end)
