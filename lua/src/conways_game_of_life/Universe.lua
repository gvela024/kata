local Cell = require 'src/conways_game_of_life/Cell'
local life_state = require 'src/conways_game_of_life/life_state_enum'

local function table_length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

local function get_state(instance)
  local grid_state = {}

  for _, row in ipairs(instance.grid) do
    local _row = {}
    for _, cell in ipairs(row) do
      table.insert(_row, cell:get_state())
    end
    table.insert(grid_state, _row)
  end

  return grid_state
end

local function get_number_of_alive_neighbors(state, row, col)
  local alive_neighbors = 0

  if row > 1 then
    local row_above = row - 1
    alive_neighbors = alive_neighbors + state[row_above][col]

    if col > 1 then
      alive_neighbors = alive_neighbors + state[row_above][col - 1]
    end

    if col < table_length(state[row]) then
      alive_neighbors = alive_neighbors + state[row_above][col + 1]
    end
  end

  -- S
  if row < table_length(state) then
    local row_below = row + 1
    alive_neighbors = alive_neighbors + state[row_below][col]

    if col > 1 then
      alive_neighbors = alive_neighbors + state[row_below][col - 1]
    end

    if col < table_length(state[row]) then
      alive_neighbors = alive_neighbors + state[row_below][col + 1]
    end
  end

  -- E
  if col < table_length(state[row]) then
    alive_neighbors = alive_neighbors + state[row][col + 1]
  end

  -- W
  if col > 1 then
    alive_neighbors = alive_neighbors + state[row][col - 1]
  end

  return alive_neighbors
end

local function update(instance)
  local state = instance:get_state()

  for row_index, row in ipairs(instance.grid) do
    local _row = {}
    for column_index, cell in ipairs(row) do
      local number_of_alive_neighbors = get_number_of_alive_neighbors(state, row_index, column_index)
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
