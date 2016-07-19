local Cell = require 'src/conways_game_of_life/Cell'
local life_state = require 'src/conways_game_of_life/life_state_enum'

describe('cell', function()
  it('should be alive on initialization', function()
    local cell = Cell();

    assert.are.equal(life_state.alive, cell.life_state)
  end)

  it('should die with only one neighbor', function()
    local cell = Cell()

    local actual = cell.get_next_state(cell, 1)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with zero neighbors', function()
    --todo
  end)
end)
