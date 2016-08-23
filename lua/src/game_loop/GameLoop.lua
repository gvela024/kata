local function run(instance)
  if instance._private.game:is_running() then
    instance._private.game:update()
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
