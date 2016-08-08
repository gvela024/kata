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

local function get_number_of_alive_neighbors(instance, row, col)
  local number_of_alive_neighbors = 0

  if row > 0 then
    local row_above = row - 1
    if col > 0 then
      local col_left = col - 1
      print('pretty sure it is failing miserably at this next condition')
      if instance.grid[row_above][col_left].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
    end
    if instance.grid[row_above][col].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
    if col < #instance.grid[row_above] - 1 then
      if instance.grid[row_above][col + 1].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
    end
  end

  if col > 0 then
    local col_left = col - 1
    if instance.grid[row][col_left].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
  end
  if col < #instance.grid[row] - 1 then
    if instance.grid[row][col + 1].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
  end

  if row > #instance.grid - 1 then
    local row_below = row + 1
    if col > 0 then
      local col_left = col - 1
      if instance.grid[row_below][col_left].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
    end
    if instance.grid[row_below][col].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
    if col < #instance.grid[row_below] - 1 then
      if instance.grid[row_below][col + 1].get_state() == life_state.alive then number_of_alive_neighbors = number_of_alive_neighbors + 1 end
    end
  end
end

local function update(instance)
  for row_index, row in ipairs(instance.grid) do
    local _row = {}
    for column_index, cell in ipairs(row) do
      local number_of_alive_neighbors = get_number_of_alive_neighbors(instance, row_index, column_index)
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
