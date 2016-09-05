local life_state = require 'src/ConwaysGameOfLife/life_state_enum'

local function update(instance, number_of_neighbors)
  if instance.life_state == life_state.alive then
    if number_of_neighbors > 1 and number_of_neighbors < 4 then
      instance.life_state =  life_state.alive
    else
      instance.life_state = life_state.dead
    end
  else
    if number_of_neighbors == 3 then
      instance.life_state = life_state.alive
    else
      instance.life_state = life_state.dead
    end
  end
end

local function get_state(instance)
  return instance.life_state
end

return function(state)
    return {
    life_state = state,
    get_state = get_state,
    update = update
  }
end
