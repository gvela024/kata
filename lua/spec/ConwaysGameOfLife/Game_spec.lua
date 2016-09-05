local Game = require 'src/ConwaysGameOfLife/Game'
local Universe = require 'src/ConwaysGameOfLife/Universe'

describe('Conways game of life game factory', function()
  local dummy_grid = {
    { X, O, X },
    { O, O, O },
    { O, X, X }
  }
  local universe_mock = {}

  before_each(function()
    universe_mock = mock(Universe(dummy_grid), true)
  end)

  it('should invoke the universe updated when game is updated', function()
    local game = Game(universe_mock)
    game:update()
    assert.stub(universe_mock.update).was.called(1)
    assert.stub(universe_mock.update).was.called_with(universe_mock)
  end)

  it('should call get_state when game is rendered', function()
    local game = Game(universe_mock)
    game:render()
    assert.stub(universe_mock.get_state).was.called(1)
    assert.stub(universe_mock.get_state).was.called_with(universe_mock)
  end)

  it('should, for now, always be running', function()
    local game = Game(universe_mock)
    assert.is_true(game:is_running())
  end)
end)
