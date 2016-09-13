local life_state = require 'src/ConwaysGameOfLife/life_state_enum'

local pillar = '*'
local left_or_right_wall = '|'
local top_or_bottom_wall = '~'

local function update(instance)
  instance._private.universe:update()
end

local function render(instance)
  local universe = instance._private.universe:get_state()
  local top_or_bottom_boundary = ''
  local cells = ''

  for _, cell_row in ipairs(universe) do
    for _, cell_life_state in ipairs(cell_row) do
      cells = cells .. left_or_right_wall
      if cell_life_state == life_state.alive then
        cells = cells .. 'X'
      else
        cells = cells .. 'O'
      end
    end
    cells = cells .. left_or_right_wall .. '\n'
  end

  for _ = 1, #universe[1] do
    top_or_bottom_boundary = top_or_bottom_boundary .. pillar .. top_or_bottom_wall
  end
  top_or_bottom_boundary = top_or_bottom_boundary .. pillar .. '\n'

  instance._private.output.print(
    top_or_bottom_boundary ..
    cells ..
    top_or_bottom_boundary)
end

local function is_running()
  return true
end

return function(universe, output)
  return {
    update = update,
    render = render,
    is_running = is_running,

    _private = {
      universe = universe,
      output = output
    }
  }
end
