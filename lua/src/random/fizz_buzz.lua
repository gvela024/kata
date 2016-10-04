--[[
Simple fizz buzz implementation
--]]

local function is_multiple_of(divisor, number)
  return number % divisor == 0
end

local function check_that_number_is_greater_than_zero(number)
  if number <= 0 then
    error('Error: number must be > 0')
  end
end

local function figure_out_result(number)
  local result = number

  if is_multiple_of(3, number) and is_multiple_of(5, number) then
    result = 'fizz buzz'
  elseif is_multiple_of(3, number) then
    result = 'fizz'
  elseif is_multiple_of(5, number) then
    result = 'buzz'
  end

  return result
end

return function(number)
  check_that_number_is_greater_than_zero(number)
  return figure_out_result(number)
end
