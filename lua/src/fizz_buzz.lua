--[[
Simple fizz buzz implementation
--]]

return function(number)
  local result = number

  if number % 3 == 0 and number % 5 == 0 then
    result = 'fizz buzz'
  elseif number % 3 == 0 then
    result = 'fizz'
  elseif number % 5 == 0 then
    result = 'buzz'
  end

  return result
end
