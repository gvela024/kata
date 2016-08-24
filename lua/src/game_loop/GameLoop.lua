local function run(instance)
  while instance._private.game:is_running() do
    instance._private.game:update()
    instance._private.game:render()
  end
end

return function(game)
  return {
    run = run,
    _private = {
      game = game
    }
  }
end
