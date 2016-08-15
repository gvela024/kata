local Universe = require 'src/conways_game_of_life/Universe'

local life_state = require 'src/conways_game_of_life/life_state_enum'
local X = life_state.alive
local O = life_state.dead

describe('universe', function()
  local function get_next_state(instance)
    instance:update()
    return instance:get_state()
  end

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

    local actual = get_next_state(universe)
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
    local actual = get_next_state(universe)
    assert.are.same(expected, actual)
  end)

  it('should consider all sorrounding neighbors when updating', function()
    local universe = Universe({
      { X, X, X },
      { X, X, X },
      { X, X, X },
    })

    local expected = {
      { X, O, X },
      { O, O, O },
      { X, O, X }
    }
    local actual = get_next_state(universe)
    assert.are.same(expected, actual)
  end)
end)
