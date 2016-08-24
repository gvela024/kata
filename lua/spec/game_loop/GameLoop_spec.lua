local GameLoop = require 'src/game_loop/GameLoop'
local Game_double = require 'spec/doubles/Game_double'
local InputHandler_double = require 'spec/doubles/InputHandler_double'

describe('The game loop', function()
  local game_loop
  local game_double
  local input_handler_double

  before_each(function()
    game_double = Game_double()
    input_handler_double = InputHandler_double()
    game_loop = GameLoop(game_double)
  end)

  it('should do nothing if the game is not running', function()
    game_loop:run()
    assert.is_false(game_double:is_updated())
  end)

  it('invokes one update if game is running', function()
    game_double:set_running_state({ true })

    game_loop:run()
    assert.is_true(game_double:is_updated())
  end)

  it('should invoke update as long as game is running', function()
    game_double:set_running_state({ true, true, true, false })

    game_loop:run()
    assert.are.equal(3, game_double:get_number_of_updates())
  end)

  it('should invoke render after update', function()
    game_double:set_running_state({ true })

    game_loop:run()
    assert.are.equal(1, game_double:get_number_of_renders())
  end)

  it('should pass input to updated', function()
    local test_input = 'some input'
    input_handler_double.setInput(test_input)
    game_double:set_running_state({ true })

    game_loop:run()
    assert.are.equal(test_input, game_double.update_with_input)
  end)
end)
