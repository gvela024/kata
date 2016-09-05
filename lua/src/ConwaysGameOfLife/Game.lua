local function update(instance)
  instance._private.universe:update()
end

local function render(instance)
  instance._private.universe:get_state()
  instance._private.output.print(
    '*~*\n' ..
    '|O|\n' ..
    '*~*\n')
end

local function is_running()
  return true
end

return function(universe, output)
  return {
    update = update,
    render = render,
    is_running = is_running,

    _private = {
      universe = universe,
      output = output
    }
  }
end
