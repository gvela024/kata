--[[
Computes all the prime factors in a number
--]]

function compute_factors_for(number)
  local candidate = 2
  local factors = {}

  while number > 1 do
    while number % candidate == 0 do
      table.insert(factors, candidate)
      number = number / candidate;
    end
    candidate = candidate + 1
  end

  return factors
end

return {
  compute_factors_for = compute_factors_for
}
