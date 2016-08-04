local Cell = require 'src/conways_game_of_life/Cell'
local life_state = require 'src/conways_game_of_life/life_state_enum'

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

    local actual = cell:get_next_state_when_number_of_neighbors_is(0)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with only one neighbor', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(1)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should survive if the cell has two neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(2)
    assert.are.equal(life_state.alive, actual)
  end)

  it('should survive if the cell has three neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(3)
    assert.are.equal(life_state.alive, actual)
  end)

  it('should die with four neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(4)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with five neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(5)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with six neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(6)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with seven neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(7)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should die with eight neighbors', function()
    local cell = Cell(life_state.alive)

    local actual = cell:get_next_state_when_number_of_neighbors_is(8)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with zero neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(0)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with one neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(1)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with two neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(2)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should become alive with three neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(3)
    assert.are.equal(life_state.alive, actual)
  end)

  it('should stay dead with four neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(4)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with five neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(5)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with six neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(6)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with seven neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(7)
    assert.are.equal(life_state.dead, actual)
  end)

  it('should stay dead with eight neighbors', function()
    local cell = Cell(life_state.dead)

    local actual = cell:get_next_state_when_number_of_neighbors_is(8)
    assert.are.equal(life_state.dead, actual)
  end)
end)
