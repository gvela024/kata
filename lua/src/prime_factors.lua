--[[
Results for the prime factors class
--]]

function compute_factors_for(number)
  if number > 1 then
    factors = {}
    if number % 2 == 0 then
      table.insert(factors, 2)
      number = number / 2;
    end
    if number > 1 then
      table.insert(factors,number)
    end
    return factors
  end

  return {}
end

return {
  compute_factors_for = compute_factors_for
}
