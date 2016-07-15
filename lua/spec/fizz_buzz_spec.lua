--[[
Tests for the fizz buzz module
--]]

local fizz_buzz = require 'src/fizz_buzz'

describe('fizz buzz', function()
  it('should return 1 as a number', function()
    assert.is.equal(1, fizz_buzz(1))
  end)

  it('should return 2 as a number', function()
    assert.is.equal(2, fizz_buzz(2))
  end)

  it('should return fizz if the number is 3', function()
    assert.is.equal('fizz', fizz_buzz(3))
  end)

  it('should return 4 as a number', function()
    assert.is.equal(4, fizz_buzz(4))
  end)

  it('should return buzz if the number is 5', function()
    assert.is.equal('buzz', fizz_buzz(5))
  end)

  it('should return fizz buzz if the number is divisible by 3 and 5', function()
    assert.is.equal('fizz buzz', fizz_buzz(7 * 5 * 3))
  end)
end)
