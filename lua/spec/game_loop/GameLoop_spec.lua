local GameLoop = require 'src/game_loop/GameLoop'
local Game_double = require 'spec/doubles/Game_double'
local InputHandler_double = require 'spec/doubles/InputHandler_double'

describe('The game loop', function()

  it('should do nothing if the game is not running', function()
    local game_double = Game_double()
    local input_handler_double = InputHandler_double()
    local game_loop = GameLoop(game_double, input_handler_double)

    game_loop:run()
    assert.is_false(game_double:is_updated())
  end)

  it('invokes one update if game is running', function()
    local game_double = Game_double()
    local input_handler_double = InputHandler_double()
    local game_loop = GameLoop(game_double, input_handler_double)

    game_double:set_running_state({ true })

    game_loop:run()
    assert.is_true(game_double:is_updated())
  end)

  it('should invoke update as long as game is running', function()
    local game_double = Game_double()
    local input_handler_double = InputHandler_double()
    local game_loop = GameLoop(game_double, input_handler_double)

    game_double:set_running_state({ true, true, true, false })

    game_loop:run()
    assert.are.equal(3, game_double:get_number_of_updates())
  end)

  it('should invoke render after update', function()
    local game_double = Game_double()
    local input_handler_double = InputHandler_double()
    local game_loop = GameLoop(game_double, input_handler_double)

    game_double:set_running_state({ true })

    -- todo this should be fixed using real mocks
    game_loop:run()
    assert.are.equal(1, game_double:get_number_of_renders())
  end)

  it('should pass input to updated', function()
    local game_double = Game_double()
    local input_handler_double = InputHandler_double()
    local game_loop = GameLoop(game_double, input_handler_double)

    local test_input = 'some input'
    input_handler_double:set_input(test_input)
    game_double:set_running_state({ true })

    game_loop:run()
    assert.are.equal(test_input, game_double:get_input())
  end)
end)
