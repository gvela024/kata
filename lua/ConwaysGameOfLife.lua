local Universe = require 'src/ConwaysGameOfLife/Universe'
local ConsoleInterfaceUi = require 'src/ConwaysGameOfLife/ConsoleInterfaceUi'
local Game = require 'src/ConwaysGameOfLife/Game'
local GameLoop = require 'src/GameLoop/GameLoop'
local life_state = require 'src/ConwaysGameOfLife/life_state_enum'
local X = life_state.alive
local O = life_state.dead

local universe = Universe({
    { X, O, X },
    { O, O, O },
    { O, X, X }
  })

local consoleUi = ConsoleInterfaceUi({ print = print })
local game = Game(universe, consoleUi)
-- todo need to create time keeper and input handler
local game_loop = GameLoop(game, nil, nil)

game_loop:run()
