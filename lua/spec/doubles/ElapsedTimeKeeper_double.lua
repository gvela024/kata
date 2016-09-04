local utils = require 'src/utils'

local function set_times(instance, times)
  instance._private.times = utils.reverse_elements(times)
end

local function get_current_time(instance)
  return table.remove(instance._private.times)
end

return function(frameDuration)
  local _frameDuration = frameDuration or 0
  local times = utils.reverse_elements({ 0, _frameDuration, _frameDuration * 2, _frameDuration * 3, _frameDuration * 4 })
  return {
    set_times = set_times,
    get_current_time = get_current_time,

    _private = {
      times = times
    }
  }
end
