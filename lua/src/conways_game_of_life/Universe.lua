local Cell = require 'src/conways_game_of_life/Cell'
local life_state = require 'src/conways_game_of_life/life_state_enum'

local function table_length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

local function get_number_of_live_neighbors_in_col(state, row, col)
  if col >= 1 and col <= table_length(state[row]) then
    return state[row][col]
  end

  return 0
end

local function get_number_of_live_neighbors_in_row(state, row, col)
  local live_neighbors = 0

  if row >= 1 and row <= table_length(state) then
    live_neighbors = live_neighbors + get_number_of_live_neighbors_in_col(state, row, col - 1)
    live_neighbors = live_neighbors + state[row][col]
    live_neighbors = live_neighbors + get_number_of_live_neighbors_in_col(state, row, col + 1)
  end

  return live_neighbors
end

local function get_number_of_alive_neighbors(state, row, col)
  local live_neighbors = 0

  live_neighbors = live_neighbors + get_number_of_live_neighbors_in_row(state, row - 1, col)
  live_neighbors = live_neighbors + get_number_of_live_neighbors_in_row(state, row + 1, col)
  live_neighbors = live_neighbors + get_number_of_live_neighbors_in_col(state, row, col - 1)
  live_neighbors = live_neighbors + get_number_of_live_neighbors_in_col(state, row, col + 1)

  return live_neighbors
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
