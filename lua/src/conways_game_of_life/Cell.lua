local life_state = require 'src/conways_game_of_life/life_state_enum'

local function get_next_state(cell, number_of_neighbors)
  return life_state.dead
end

return function()
    return {
    life_state = life_state.alive,
    get_next_state = get_next_state
  }
end
