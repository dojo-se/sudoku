# http://dojopuzzles.com/problemas/exibe/sudoku/
# DOJO 2014-07-03 (DPSistemas)

require "minitest/autorun"

class TestSudoku < Minitest::Test
  def test_that_arr_empty
    arr = [
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0]
          ]

    assert_equal false, Sudoku.problem(arr)
  end

  def test_that_arr_contains_same_number_horizontally
    arr = [
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9],
            [1,2,3,4,5,2,7,8,9]
          ]

    assert_equal false, Sudoku.problem(arr)
  end

  def test_that_arr_contains_same_number_vertically
    arr = [
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9],
            [1,2,3,4,5,6,7,8,9]
          ]

    assert_equal false, Sudoku.problem(arr)
  end

  def test_that_arr_is_valid
    arr = [
            [1,2,3,4,5,6,7,8,9],
            [2,3,4,5,6,7,8,9,1],
            [3,4,5,6,7,8,9,1,2],
            [4,5,6,7,8,9,1,2,3],
            [5,6,7,8,9,1,2,3,4],
            [6,7,8,9,1,2,3,4,5],
            [7,8,9,1,2,3,4,5,6],
            [8,9,1,2,3,4,5,6,7],
            [9,1,2,3,4,5,6,7,8]
          ]

    assert_equal true, Sudoku.problem(arr)
  end
end

class Sudoku

  def self.problem(arr)
    # all equal to zero
    arr.map { |line| return false if line.include?(0) }

    # same number vertically
    first_line = arr[0]
    first_line.map.with_index do |top, i|
      (1..8).map do |idx|
        return false if top == arr[i][idx]
      end
    end

    # same number horizontally
    arr.map.with_index do |line, i|
      current = line[0]
      (1..8).map do |idx|
        return false if current == line[idx]
      end
    end

    true
  end

end
