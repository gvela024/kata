local ConsoleInterfaceUi = require 'src/ConwaysGameOfLife/ConsoleInterfaceUi'
local life_state = require 'src/ConwaysGameOfLife/life_state_enum'
local X = life_state.alive
local O = life_state.dead

describe('Console interface UI', function()
  local consoleUi = {}
  local output_mock = {}
  local output = {
    print = function() return nil end
  }

  before_each(function()
    output_mock = mock(output, true)
    consoleUi = ConsoleInterfaceUi(output_mock)
  end)

  after_each(function()
    mock.revert(output_mock)
  end)

  it('should draw a single dead cell', function()
    consoleUi:draw({ { O } })
    assert.stub(output_mock.print).was.called_with(
      '*~*\n' ..
      '|O|\n' ..
      '*~*\n')
  end)

  it('should draw a single live cell', function()
    consoleUi:draw({ { X } })
    assert.stub(output_mock.print).was.called_with(
      '*~*\n' ..
      '|X|\n' ..
      '*~*\n')
  end)

  it('should draw multiple cells', function()
    consoleUi:draw(
        {
          { X, O, O },
          { O, X, O },
          { X, X, O }
        })
    assert.stub(output_mock.print).was.called_with(
      '*~*~*~*\n' ..
      '|X|O|O|\n' ..
      '|O|X|O|\n' ..
      '|X|X|O|\n' ..
      '*~*~*~*\n')
  end)
end)
