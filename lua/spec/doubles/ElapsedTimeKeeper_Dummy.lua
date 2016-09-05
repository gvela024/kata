-- dummy function
local function get_current_time(instance)
  return nil
end

return function()
  return {
    get_current_time = get_current_time,
  }
end
