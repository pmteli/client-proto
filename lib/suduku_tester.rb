require "observer"

class SudukuTester
  include Observable



  def initialize(puzzle)
    if puzzle != nil
      @solved_grid = puzzle
    else
      @solved_grid  = Array.new(9) { Array.new(9) }
      # populate grid
      x = 0
      y = 0
      [1,6,3,5,2,9,7,8,3].each do | i |
        @solved_grid[x][y] = i
        y += 1
      end
      x = 1
      y = 0
      row = [8,3,9,7,1,4,2,6,5]
      row.each_index do | i |
        @solved_grid[x][y] = row[i]
        y = y += 1
      end
    end
  end

  def run
    (0..8).each do | x |
      (0..8).each do | y |
        changed
        puts "calling notify for  #{x} #{y} with #{@solved_grid[x][y]}"
        notify_observers(x, y, @solved_grid[x][y])
      end
    end
  end

end

class Cell

  def initialize(puzzle, x, y)
    @x = x
    @y = y
    @accepted_values = [1,2,3,4,5,6,7,8,9]
    puzzle.add_observer(self)
  end

  def update(x, y, value)
    if do_i_care?(x,y)
      if @accepted_values.include?(value)
        puts "updating cell at #{@x} #{@y} with #{value}"
        @accepted_values.delete(value)
        puts "accepted values = #{@accepted_values}"
      else
        #debugger
        puts "cell[#{x}, #{y}] can not accept #{value}"
        return false
      end
    end
  end

  def do_i_care?(x, y)
    if @x == x
      return true
    else
      return false
    end
  end
end

class Grid

  def initialize(puzzle)
    @puzzle = puzzle
    @grid = Array.new(9) { Array.new(9) }
    (0..8).each do | x |
      (0..8).each do | y |
        @grid[x][y] = Cell.new(puzzle, x, y)
      end
    end
  end

  def test
    @puzzle.run()
  end

end


