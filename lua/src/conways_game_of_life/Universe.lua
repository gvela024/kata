local Cell = require 'src/conways_game_of_life/Cell'
local life_state = require 'src/conways_game_of_life/life_state_enum'

local function table_length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

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
  local alive_neighbors = 0

  print(row, col)

  -- NW
  if row > 1  and col > 1 then
    print('NW')
    -- if instance.grid[row - 1][col - 1].get_sate() == life_state.alive then alive_neighbors = alive_neighbors + 1 end
  end

  -- W
  if col > 1 then
    print('W')
    -- if instance.grid[row][col - 1].get_sate() == life_state.alive then alive_neighbors = alive_neighbors + 1 end
  end

  -- SW
  if row < table_length(instance.grid) and col > 1 then
    print('SW')
  end

  -- S
  if row < table_length(instance.grid) then
    print('S')
  end

  -- SE
  if row < table_length(instance.grid) and col < table_length(instance.grid[row]) then
    print('SE')
  end

  -- E
  if col < table_length(instance.grid[row]) then
    print('E')
  end

  -- NE
  if row > 1 and col < table_length(instance.grid[row]) then
    print('NE')
  end

  -- N
  if row > 1 then
    print('N')
  end

  return alive_neighbors
end

local function update(instance)
  for row_index, row in ipairs(instance.grid) do
    local _row = {}
    for column_index, cell in ipairs(row) do
      local number_of_alive_neighbors = get_number_of_alive_neighbors(instance, row_index, column_index)
      cell:update(number_of_alive_neighbors)
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
