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

  it('should update one cell to dead since it has no neighbors', function()
    local universe = Universe({ { X } })

    universe:update()
    local actual = universe:get_state()
    assert.are.same({ { O } }, actual)
  end)

  it('should update all cells', function()
    local universe = Universe({
      { O, X, X },
      { X, O, X },
      { O, O, X },
    })

    local expected = {
      { O, X, X },
      { O, O, X },
      { O, X, O }
    }
    universe:update()
    local actual = universe:get_state()
    assert.are.same(expected, actual)
  end)
end)
