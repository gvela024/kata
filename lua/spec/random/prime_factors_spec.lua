--[[
Source: http://www.codekatas.org/casts/prime-factors-code-kata-by-lets-developer
Tests for the prime factors class
--]]

local prime_factors = require 'src/random/prime_factors'

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

  it('five has only itself as a prime factor', function()
    assert.are.same({ 5 }, prime_factors.compute_factors_for(5))
  end)

  it('six has 2 and 3 as prime factors', function()
    assert.are.same({ 2, 3}, prime_factors.compute_factors_for(6))
  end)

  it('eight has 3 times 2 as prime factors', function()
    assert.are.same({ 2, 2, 2 }, prime_factors.compute_factors_for(8))
  end)

  it('9 has 2 times 3 as prime factors', function()
    assert.are.same({ 3, 3 }, prime_factors.compute_factors_for(9))
  end)

  it('10 has 2 and 5 as prime factors', function()
    assert.are.same({ 2, 5 }, prime_factors.compute_factors_for(10))
  end)
end)
