local life_state = require 'src/conways_game_of_life/life_state_enum'

local function get_next_state_when_number_of_neighbors_is(cell, number_of_neighbors)
  if cell.life_state == life_state.alive then
    if number_of_neighbors > 1 and number_of_neighbors < 4 then
      return life_state.alive
    end
  else
    if number_of_neighbors == 3 then
      return life_state.alive
    end
  end

  return life_state.dead
end

return function(state)
    return {
    life_state = state,
    get_next_state_when_number_of_neighbors_is = get_next_state_when_number_of_neighbors_is
  }
end
