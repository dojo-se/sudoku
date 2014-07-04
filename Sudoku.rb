# http://dojopuzzles.com/problemas/exibe/sudoku/
# DOJO 2014-07-03 (DPSistemas)

require "minitest/autorun"

class TestSudoku < Minitest::Test
  describe "Array" do
    it "is invalid when is empty" do
      arr = Array.new(9) { Array.new(9) { 0 } }

      assert_equal false, Sudoku.problem(arr)
    end

    describe "when have same number" do
      before do
        @arr = Array.new(9) { Array.new(9) { |i| i+1 } }
      end

      it "is interating horizontally" do
        assert_equal false, Sudoku.problem(@arr)
      end

      it "is interating vertically" do
        assert_equal false, Sudoku.problem(@arr)
      end
    end

    it "is valid" do
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
end

class Sudoku

  def self.problem(arr)
    # all equal to zero
    arr.map { |row| return false if row.include?(0) }

    # same number vertically
    first_row = arr[0]
    first_row.map.with_index do |top, i|
      (1..8).map do |idx|
        return false if top == arr[i][idx]
      end
    end

    # same number horizontally
    arr.map.with_index do |row, i|
      current = row[0]
      (1..8).map do |idx|
        return false if current == row[idx]
      end
    end

    true
  end

end
