local Cell = require 'src/conways_game_of_life/Cell'
local life_state = require 'src/conways_game_of_life/life_state_enum'

local function get_state(instance)
  local grid_state = {}

  -- Don't know that I like this way of storing the grid. I think
  -- the grid should be pre made by some other module that does it
  -- randomly and the Universe just manages it.
  for _, row in ipairs(instance.grid) do
    local _row = {}
    for _, cell in ipairs(row) do
      table.insert(_row, cell:get_state())
    end
    table.insert(grid_state, _row)
  end

  return grid_state
end

local function update(instance)
  for _, row in ipairs(instance.grid) do
    local _row = {}
    for _, cell in ipairs(row) do
      cell:update(0)
    end
  end
end

return function(_grid)
  local grid = {}

  for _, row in ipairs(_grid) do
    local _row = {}
    for _, state in ipairs(row) do
      table.insert(_row, Cell(state))
    end
    table.insert(grid, _row)
  end

  return {
    get_state = get_state,
    grid = grid,
    update = update
  }
end
