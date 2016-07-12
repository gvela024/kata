--[[
Source: http://www.codekatas.org/casts/prime-factors-code-kata-by-lets-developer
Tests for the prime factors class
--]]

local prime_factors = require 'src/prime_factors'

describe('Prime factors', function()
  it('one should have no prime factors', function()
    assert.are.same({}, prime_factors.compute_factors_for(1))
  end)

  it('two has only itself as a prime factor', function()
    assert.are.same({ 2 }, prime_factors.compute_factors_for(2))
  end)

  it('three has only itself as a prime factor', function()
    assert.are.same({ 3 }, prime_factors.compute_factors_for(3))
  end)

  it('four has two times two as prime factors', function()
    assert.are.same({ 2, 2 }, prime_factors.compute_factors_for(4))
  end)

  --@7:52
  it('five', function() assert.is_true(false) end)
end)
