local function update(instance)
  instance._private.universe:update()
end

local function render(instance)
  local universe = instance._private.universe:get_state()
  local roof = ''
  local floor = ''
  
  for k, v in pairs(universe) do
    print(k, v)
    for j, k in pairs(v) do
      print(j, k)
    end
  end

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
