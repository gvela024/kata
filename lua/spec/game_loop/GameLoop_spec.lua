local GameLoop = require 'src/game_loop/GameLoop'
local Game_double = require 'spec/doubles/Game_double'

describe('The game loop', function()
  local game_double

  before_each(function()
    game_double = Game_double()
  end)

  it('should do nothing if the game is not running', function()
    local game_loop = GameLoop(game_double)

    game_loop:run()
    assert.is_false(game_double:is_updated())
  end)

  it('invokes one update if game is running', function()
    local game_loop = GameLoop(game_double)
    game_double:set_running_state({ true })

    game_loop:run()
    assert.is_true(game_double:is_updated())
  end)

  it('should invoke update as long as game is running', function()
    local game_loop = GameLoop(game_double)
    game_double:set_running_state({ true, true, true, false })

    game_loop:run()
    assert.are.equal(3, game_double:get_number_of_updates())
  end)

  it('should invoke render after update', function()
    local game_loop = GameLoop(game_double)
    game_double:set_running_state({ true })

    game_loop:run()
    assert.are.equal(1, game_double:get_number_of_renders())
  end)
end)
