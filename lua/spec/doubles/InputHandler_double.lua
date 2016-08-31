local function set_input(instance, input)
  instance._private.current_input = input
end

local function get_current_input(instance)
  return instance._private.current_input
end

return function()
  return {
    set_input = set_input,
    get_current_input = get_current_input,

    _private = {}
  }
end
