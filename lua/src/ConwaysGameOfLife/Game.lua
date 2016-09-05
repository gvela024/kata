local function update(instance)
  instance._private.universe:update()
end

local function render(instance)
  instance._private.universe:get_state()
end

local function is_running()
  return true
end

return function(universe)
  return {
    update = update,
    render = render,
    is_running = is_running,

    _private = {
      universe = universe
    }
  }
end
