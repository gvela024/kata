--[[-
https://www.techiedelight.com/huffman-coding/
https://people.ok.ubc.ca/ylucet/DS/Huffman.html
]]

describe('huffman', function()
  local Huffman = require 'src.compression.huffman'

  -- it('should create unordered map', function()
  --   local huffman = Huffman('aaabbc')

  --   assert.are.same({ a = 3, b = 2, c = 1 }, huffman.unordered_map)
  -- end)

  -- it('should create a priority queue', function()
  --   local huffman = Huffman('aaabbc')

  --   -- choosing not to test this guy since the order
  --   -- in which the unordered tree is parsed isn't guaranteed...
  --   -- in lua anyway
  --   -- assert.are.same(
  --   --   {
  --   --     { character = 'a', frequency = 3 },
  --   --     { character = 'b', frequency = 2 },
  --   --     { character = 'c', frequency = 1 }
  --   --   },
  --   --   huffman.priority_queue
  --   -- )
  -- end)

  it('should create the huffman codes', function()
    local huffman = Huffman('aaabbc')

    assert.are.same(
      {
        b = '11',
        a = '0',
        c = '10'
      },
      huffman.huffman_codes
    )
  end)

  -- it('should encode characters', function()
  --   local huffman = Huffman("aaabbc")
  --   assert.are.same(
  --     {
  --       b = '11',
  --       a = '0',
  --       c = '10'
  --     },
  --     huffman.codes
  --   )
  -- end)
end)
