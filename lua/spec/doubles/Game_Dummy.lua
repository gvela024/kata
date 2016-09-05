-- dummy function
local function update(instance, input)
  return nil
end

-- dummy function
local function is_running(instance)
  return nil
end

-- dummy function
local function render(instance)
  return nil
end

return function()
  return {
    update = update,
    render = render,
    is_running = is_running,
  }
end
