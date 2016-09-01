local function run(instance)
  while instance._private.game:is_running() do
    -- @warning, order here is strict
    instance._private.game:update(instance._private.input_handler:get_current_input())
    instance._private.game:render()
  end
end

return function(game, input_handler)
  return {
    run = run,

    _private = {
      game = game,
      input_handler = input_handler
    }
  }
end
