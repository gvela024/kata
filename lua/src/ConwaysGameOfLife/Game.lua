local function update(instance)
  instance._private.universe:update()
end

local function render(instance)
  local universe = instance._private.universe:get_state()
  instance._private.drawing_mechanism:draw(universe)
end

local function is_running()
  return true
end

return function(universe, drawing_mechanism)
  return {
    update = update,
    render = render,
    is_running = is_running,

    _private = {
      universe = universe,
      drawing_mechanism = drawing_mechanism
    }
  }
end
