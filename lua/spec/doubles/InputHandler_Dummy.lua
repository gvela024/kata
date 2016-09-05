-- dummy function
local function get_current_input(instance)
  return nil
end

return function()
  return {
    get_current_input = get_current_input,
  }
end
