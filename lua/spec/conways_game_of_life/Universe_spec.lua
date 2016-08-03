local Universe = require 'src/conways_game_of_life/Universe'

local life_state = require 'src/conways_game_of_life/life_state_enum'
local X = life_state.alive
local O = life_state.dead

describe('universe', function()
  it('should store its initial state', function()
    local expected = {
      { X, O, X },
      { O, O, O },
      { O, X, X }
    }
    local universe = Universe(expected)

    local actual = universe:get_state()
    assert.are.same(expected, actual)
  end)
end)
