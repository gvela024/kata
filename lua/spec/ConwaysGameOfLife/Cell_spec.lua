local Cell = require 'src/ConwaysGameOfLife/Cell'
local life_state = require 'src/ConwaysGameOfLife/life_state_enum'

describe('cell', function()
  it('should be alive on initialization', function()
    local cell = Cell(life_state.alive);

    -- Gotta figure out how to do private variables in here...
    assert.are.equal(life_state.alive, cell.life_state)
  end)

  it('should be dead on initialization', function()
    local cell = Cell(life_state.dead);

    assert.are.equal(life_state.dead, cell.life_state)
  end)

  it('should die with zero neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(0);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with only one neighbor', function()
    local cell = Cell(life_state.alive)

    cell:update(1);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should survive if the cell has two neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(2);
    local actual = cell:get_state()
    assert.are.equal(life_state.alive, actual)
  end)

  it('should survive if the cell has three neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(3);
    local actual = cell:get_state()
    assert.are.equal(life_state.alive, actual)
  end)

  it('should die with four neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(4);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with five neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(5);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with six neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(6);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with seven neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(7);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with eight neighbors', function()
    local cell = Cell(life_state.alive)

    cell:update(8);
    local actual = cell:get_state(8)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with zero neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(0)
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with one neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(1);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with two neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(2);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should become alive with three neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(3);
    local actual = cell:get_state()
    assert.are.equal(life_state.alive, actual)
  end)

  it('should stay dead with four neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(4);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with five neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(5);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with six neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(6);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with seven neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(7);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with eight neighbors', function()
    local cell = Cell(life_state.dead)

    cell:update(8);
    local actual = cell:get_state()
    assert.are.equal(life_state.dead, actual)
  end)
end)
