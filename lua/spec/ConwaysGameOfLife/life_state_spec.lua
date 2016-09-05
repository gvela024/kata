local life_state = require 'src/ConwaysGameOfLife/life_state_enum'

describe('life state', function()
  it('alive should equal 1 and dead should equal 0', function()
    assert.are.equal(1, life_state.alive)
    assert.are.equal(0, life_state.dead)
  end)
end)
