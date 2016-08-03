local life_state = require 'src/conways_game_of_life/life_state_enum'

local function get_state(instance)
  return instance.grid
end

return function(grid)
  return {
    get_state = get_state,
    grid = grid
  }
end
