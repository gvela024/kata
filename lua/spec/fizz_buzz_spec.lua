--[[
Tests for the fizz buzz module
--]]

local fizz_buzz = require 'src/fizz_buzz'

describe('fizz buzz', function()
  it('should return number if number is not divisible by 3 or 5', function()
    assert.is.equal(1, fizz_buzz(1))
    assert.is.equal(2, fizz_buzz(2))
    assert.is.equal(4, fizz_buzz(4))
  end)

  it('should return fizz if the number is 3', function()
    assert.is.equal('fizz', fizz_buzz(3))
  end)

  it('should return buzz if the number is 5', function()
    assert.is.equal('buzz', fizz_buzz(5))
  end)

  it('should return fizz buzz if the number is divisible by 3 and 5', function()
    assert.is.equal('fizz buzz', fizz_buzz(7 * 5 * 3))
  end)

  it('should assert for 0 and below', function()
    local error_input_0 = function()
      fizz_buzz(0)
    end

    local error_input_below_0 = function()
      fizz_buzz(-2)
    end

    assert.has_error(error_input_0, 'Error: number must be > 0')
    assert.has_error(error_input_below_0, 'Error: number must be > 0')
  end)
end)
