local function set_running_state(instance, running_state)
  instance._private.running_state = running_state
end

local function update(instance)
  instance._private.updated = true
end

local function is_running(instance)
  return instance._private.running_state
end

local function is_updated(instance)
  return instance._private.updated
end

return function()
  local updated = false
  local running_state = false

  return {
    set_running_state = set_running_state,
    update = update,
    is_running = is_running,
    is_updated = is_updated,
    _private = {
      updated = updated,
      running_state = running_state
    }
  }
end
