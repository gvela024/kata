--[[
Bubble sort, sometimes referred to as sinking sort, is a simple sorting
algorithm that repeatedly steps through the list to be sorted, compares
each pair of adjacent items and swaps them if they are in the wrong order.
The pass through the list is repeated until no swaps are needed, which
indicates that the list is sorted.

procedure bubbleSort( A : list of sortable items )
   n = length(A)
   repeat
     swapped = false
     for i = 1 to n-1 inclusive do
       /* if this pair is out of order */
       if A[i-1] > A[i] then
         /* swap them and remember something changed */
         swap( A[i-1], A[i] )
         swapped = true
       end if
     end for
   until not swapped
end procedure

Optimization #1
procedure bubbleSort( A : list of sortable items )
    n = length(A)
    repeat
       swapped = false
       for i = 1 to n-1 inclusive do
          if A[i-1] > A[i] then
             swap(A[i-1], A[i])
             swapped = true
          end if
       end for
       n = n - 1
    until not swapped
end procedure

Optimization #2
procedure bubbleSort( A : list of sortable items )
    n = length(A)
    repeat
       newn = 0
       for i = 1 to n-1 inclusive do
          if A[i-1] > A[i] then
             swap(A[i-1], A[i])
             newn = i
          end if
       end for
       n = newn
    until n = 0
end procedure
]]

describe('Bubble sort', function()
  local bubble_sort = require 'src/sorting/bubble-sort'

  it('should sort two numbers in ascending order', function()
    assert.are.same({ 1, 2 }, bubble_sort.ascending({ 2, 1 }))
  end)

  it('should sort three numbers in ascending order', function()
    assert.are.same({ -1, 1, 2 }, bubble_sort.ascending({ 1, -1, 2 }))
  end)

  it('should sort a set of numbers in ascending order', function()
    assert.are.same({-3, -3, -2.2, 0, 4, 4.9, 4.9, 7, 10}, bubble_sort.ascending({10, 4.9, -3, 4, 0, -2.2, 4.9, 7, -3}))
  end)

  it('should not modify the original set', function()
    local actual = {4, 2, 3, 1}
    bubble_sort.ascending(actual)
      assert.are.same({4, 2, 3, 1}, actual)
  end)
end)
