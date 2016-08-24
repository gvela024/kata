local function reverse_elements(original_table)
  local reversed_table = {}

  while #original_table >= 1 do
    table.insert(reversed_table, table.remove(original_table))
  end

  return reversed_table
end

local function set_running_state(instance, running_state)
  instance._private.running_state = reverse_elements(running_state)
end

local function update(instance)
  instance._private.number_of_updates = instance._private.number_of_updates + 1
  instance._private.updated = true
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

local function render(instance)
  if instance._private.number_of_renders ~= instance._private.number_of_updates - 1 then
    error('Calling render before update')
  end
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

    set_running_state = set_running_state,
    is_running = is_running,
    is_updated = is_updated,
    get_number_of_updates = get_number_of_updates,
    get_number_of_renders = get_number_of_renders,
    _private = {
      updated = updated,
      running_state = running_state,
      number_of_updates = number_of_updates,
      number_of_renders = number_of_renders
    }
  }
end
