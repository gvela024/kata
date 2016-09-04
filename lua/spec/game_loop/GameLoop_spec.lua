local GameLoop = require 'src/game_loop/GameLoop'
local Game_double = require 'spec/doubles/Game_double'
local InputHandler_double = require 'spec/doubles/InputHandler_double'
local ElapsedTimeKeeper_double = require 'spec/doubles/ElapsedTimeKeeper_double'
local utils = require 'src/utils'

describe('The game loop', function()
  local testFrameDuration = 1000 / 60
  local game_mock = {}
  local input_handler_mock = {}

  before_each(function()
    game_mock = mock(Game_double(), true)
    input_handler_mock = mock(InputHandler_double(), true)
    elapsed_time_keeper_mock = mock(ElapsedTimeKeeper_double(), true)
  end)

  local function set_running_states_to(states)
    local _states = utils.reverse_elements(states)
    game_mock.is_running.on_call_with(game_mock).invokes(function()
      return table.remove(_states)
    end)
  end

  local function get_times(times)
  end

  local function set_elapsed_times_to(times)
    local _times = utils.reverse_elements(times)
    elapsed_time_keeper_mock.get_current_time.on_call_with(elapsed_time_keeper_mock).invokes(function()
      return table.remove(_times)
    end)
  end

  it('should check if the game is running', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)
    game_loop:run()
    assert.stub(game_mock.is_running).was.called_with(game_mock)
  end)

  it('should do nothing if the game is not running', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)

    game_mock.is_running.on_call_with(game_mock).returns(false)
    game_loop:run()
    assert.stub(game_mock.update).was_not.called()
  end)

  it('should invoke one update if game is running', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)

    set_elapsed_times_to({ 0, testFrameDuration })
    set_running_states_to({ true, false })

    game_loop:run()
    assert.stub(game_mock.update).was.called(1)
  end)

  it('should invoke update as long as game is running', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)

    set_elapsed_times_to({ 0, testFrameDuration, testFrameDuration * 2, testFrameDuration * 3 })
    set_running_states_to({ true, true, true, false })
    game_loop:run()
    assert.stub(game_mock.update).was.called(3)
  end)

  it('should invoke render after update', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)

    set_elapsed_times_to({ 0, testFrameDuration })
    set_running_states_to({ true, false })

    game_mock.update.on_call_with(game_mock, match._).invokes(function()
      assert.stub(game_mock.render).was_not.called()
    end)
    game_loop:run()
  end)

  it('should pass input to update', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)
    local test_input = 'some input'

    set_elapsed_times_to({ 0, testFrameDuration })
    set_running_states_to({ true, false })
    input_handler_mock.get_current_input.on_call_with(input_handler_mock).returns(test_input)
    game_loop:run()
    assert.stub(game_mock.update).was.called_with(game_mock, test_input)
  end)

  it('should skip update if loop is too fast', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)

    set_elapsed_times_to({ 0, 1 })
    set_running_states_to({ true, false })
    game_loop:run()
    assert.stub(game_mock.update).was.called(0)
    assert.stub(game_mock.render).was.called(1)
  end)

  it('should do aditional update if loop is too slow', function()
    local game_loop = GameLoop(game_mock, input_handler_mock, elapsed_time_keeper_mock)

    set_elapsed_times_to({ 0, testFrameDuration * 2 })
    set_running_states_to({ true, false })

    game_loop:run()
    assert.stub(game_mock.update).was.called(2)
    assert.stub(game_mock.render).was.called(1)
  end)
end)
