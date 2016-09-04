local utils = require 'src/utils'

local function set_running_state(instance, running_state)
  instance._private.running_state = utils.reverse_elements(running_state)
end

local function update(instance, input)
  instance._private.number_of_updates = instance._private.number_of_updates + 1
  instance._private.updated = true
  instance._private.updated_with_input = input
end

local function is_running(instance)
  return table.remove(instance._private.running_state)
end

local function is_updated(instance)
  return instance._private.updated
end

local function get_number_of_updates(instance)
  return instance._private.number_of_updates
end

local function get_number_of_renders(instance)
  return instance._private.number_of_renders
end

local function get_input(instance)
  return instance._private.updated_with_input
end

local function render(instance)
  instance._private.number_of_renders = instance._private.number_of_renders + 1
end

return function()
  local updated = false
  local running_state = { false }
  local number_of_updates = 0
  local number_of_renders = 0

  return {
    update = update,
    render = render,
    is_running = is_running,

    set_running_state = set_running_state,
    is_updated = is_updated,
    get_number_of_updates = get_number_of_updates,
    get_number_of_renders = get_number_of_renders,
    get_input = get_input,
    _private = {
      updated = updated,
      running_state = running_state,
      number_of_updates = number_of_updates,
      number_of_renders = number_of_renders
    }
  }
end
