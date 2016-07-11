--[[
Source: http://www.codekatas.org/casts/prime-factors-code-kata-by-lets-developer
Tests for the prime factors class
--]]

local prime_factors = require 'src/prime_factors'

describe('Prime factors', function()
  it('one should have no prime factors', function() -- @3:53
    assert.are.same({}, prime_factors.compute_factors_for(1));
  end)
end)
