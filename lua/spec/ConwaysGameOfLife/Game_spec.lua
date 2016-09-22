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
  local drawing_mechanism_mock = {}
  local drawing_mechanism = {
    draw = function() return nil end
  }

  before_each(function()
    universe_mock = mock(Universe(dummy_grid), true)
    drawing_mechanism_mock = mock(drawing_mechanism, true)
    game = Game(universe_mock, drawing_mechanism_mock)
  end)

  after_each(function()
    mock.revert(drawing_mechanism_mock)
  end)

  it('should invoke the universe updated when game is updated', function()
    game:update()
    assert.stub(universe_mock.update).was.called(1)
    assert.stub(universe_mock.update).was.called_with(universe_mock)
  end)

  it('should call get_state when game is rendered', function()
    game:render()
    assert.stub(universe_mock.get_state).was.called(1)
  end)

  it('should, for now, always be running', function()
    assert.is_true(game:is_running())
  end)

  it('should call the drawing mechanisms draw function with the universe when rendering', function()
    local universe = 'meh'
    universe_mock.get_state.on_call_with(universe_mock).returns(universe)
    game:render()
    assert.stub(drawing_mechanism_mock.draw).was.called(1)
    assert.stub(drawing_mechanism_mock.draw).was.called_with(drawing_mechanism_mock, universe)
  end)
end)
