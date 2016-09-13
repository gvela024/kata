local Game = require 'src/ConwaysGameOfLife/Game'
local Universe = require 'src/ConwaysGameOfLife/Universe'
local life_state = require 'src/ConwaysGameOfLife/life_state_enum'
local X = life_state.alive
local O = life_state.dead

describe('Conways game of life game factory', function()
  local dummy_grid = {
    { X, O, X },
    { O, O, O },
    { O, X, X }
  }
  local universe_mock = {}
  local game = {}
  local output = {
    print = function() return nil end
  }

  before_each(function()
    universe_mock = mock(Universe(dummy_grid), true)
    output_mock = mock(output, true)
    game = Game(universe_mock, output_mock)
  end)

  after_each(function()
    mock.revert(output_mock)
  end)

  it('should invoke the universe updated when game is updated', function()
    game:update()
    assert.stub(universe_mock.update).was.called(1)
    assert.stub(universe_mock.update).was.called_with(universe_mock)
  end)

  it('should call get_state when game is rendered', function()
    universe_mock.get_state.on_call_with(universe_mock).returns({ { O } })
    game:render()
    assert.stub(universe_mock.get_state).was.called(1)
    assert.stub(universe_mock.get_state).was.called_with(universe_mock)
  end)

  it('should, for now, always be running', function()
    assert.is_true(game:is_running())
  end)

  it('should call print once', function()
    universe_mock.get_state.on_call_with(universe_mock).returns({ { O } })
    game:render()
    assert.stub(output_mock.print).was.called(1)
  end)

  -- I don't think that this guy should actually be drawing. This should probably go to a
  -- UI or drawer object so the way the game is drawn can be switched out quickly.
  -- For now, I think I'll just make a goofy CLI UI
  it('should print a dead cell', function()
    universe_mock.get_state.on_call_with(universe_mock).returns({ { O } })
    game:render()
    assert.stub(output_mock.print).was.called_with(
      '*~*\n' ..
      '|O|\n' ..
      '*~*\n')
  end)

  it('should print a living cell', function()
    universe_mock.get_state.on_call_with(universe_mock).returns({ { X } })
    game:render()
    assert.stub(output_mock.print).was.called_with(
      '*~*\n' ..
      '|X|\n' ..
      '*~*\n')
  end)

  it('should print several living and dead cells', function()
    universe_mock.get_state.on_call_with(universe_mock).returns(
      {
        { X, O, O },
        { O, X, O },
        { X, X, O }
      })
    game:render()
    assert.stub(output_mock.print).was.called_with(
      '*~*~*~*\n' ..
      '|X|O|O|\n' ..
      '|O|X|O|\n' ..
      '|X|X|O|\n' ..
      '*~*~*~*\n')
  end)
end)
