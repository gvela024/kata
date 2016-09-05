local frameDuration = 1000 / 60

local function run(instance)
  local previous_time = instance._private.elapsed_time_keeper:get_current_time()

  while instance._private.game:is_running() do
    local current_time = instance._private.elapsed_time_keeper:get_current_time()
    local lag = current_time - previous_time

    while math.floor(lag) >= math.floor(frameDuration) do
      instance._private.game:update(instance._private.input_handler:get_current_input())
      lag = lag - frameDuration
    end
    instance._private.game:render()
    previous_time = current_time
  end
end

return function(game, input_handler, elapsed_time_keeper)
  return {
    run = run,

    _private = {
      game = game,
      input_handler = input_handler,
      elapsed_time_keeper = elapsed_time_keeper
    }
  }
end
