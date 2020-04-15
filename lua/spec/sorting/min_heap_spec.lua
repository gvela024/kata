--[[-
Tree such that
- the data contained in each node is less than or equal to the node's children
- the binary tree is complete
  - full tree is a tree which every node other than the leaves have two children
  - complete tree is a tree which every level, except possibly the last, is filled and the nodes are as far left as possible

Uses for min heap
- Priority queue: it's really fast to fing the highest value element O(logn)
- Graph algorithms: like Dijkstra's shortest path
- K'th largest element
- Sort an almost sorted array
- Merge K sorted arrays

https://www.cs.usfca.edu/~galles/visualization/Heap.html
https://visualgo.net/en/heap
]]

describe('min heap', function()
  local min_heap = require 'src.sorting.min_heap'

  it('should insert one element', function()
    local min_heap = min_heap()

    min_heap.insert({ 1 })
    assert.are.same({ 1 }, min_heap.tree)
  end)

  it('should insert two elements', function()
    local min_heap = min_heap()

    min_heap.insert({ 1, 2 })
    assert.are.same({ 1, 2 }, min_heap.tree)
  end)

  it('should insert three elements in min heap order', function()
    local min_heap = min_heap()

    min_heap.insert({ 2, 6, 1 })
    assert.are.same({ 1, 6, 2 }, min_heap.tree)
  end)

  it('should insert elements correctly if multiple rearrangements are requires', function()
    local min_heap = min_heap()

    min_heap.insert({ 9, 14, 19, 24, 8 })
    assert.are.same({ 8, 9, 19, 24, 14 }, min_heap.tree)
  end)

  it('should remove minimum', function()
    local min_heap = min_heap()
    min_heap.insert({ 3, 9, 4, 12, 33, 6, 40, 55, 35, 66, 67, 45 })

    assert.are.equal(3, min_heap.get_minimum())
    assert.are.same({ 4, 9, 6, 12, 33, 45, 40, 55, 35, 66, 67 }, min_heap.tree)

    assert.are.equal(4, min_heap.get_minimum())
    assert.are.same({ 6, 9, 40, 12, 33, 45, 67, 55, 35, 66 }, min_heap.tree)
  end)
end)
