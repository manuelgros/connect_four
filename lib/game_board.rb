# frozen_string_literal: true

# Class for the game board (size 7 wide and 6 high), includes methods
# to create and navigate the game board
class GameBoard
  attr_reader :coordinates, :board

  def initialize(width = 7, height = 6)
    @width = width
    @height = height
    @coordinates = create_coordinates
    @board = create_board(coordinates)
    @white_tile = "\u26AA"
    @black_tile = "\u26AB"
  end

  # Creates coordinates[] with all possible positions on playing board
  def create_coordinates
    x_coord = Array(0..(@width - 1))
    y_coord = Array(0..(@height - 1))
    x_coord.each_with_object([]) do |first_ele, coord_arr|
      y_coord.each { |second_ele| coord_arr << [first_ele, second_ele] }
      coord_arr
    end
  end

  # Creates board{} from coordinates[] with all values set to nil
  def create_board(coord_arr)
    coord_arr.each_with_object({}) do |coord, hash|
      hash[coord] = nil
      hash
    end
  end

  # method to check if column exists in board range
  def column_exist?(selection)
    @coordinates.any? { |coord_pair| coord_pair[0] == selection - 1 }
  end

  # method to return array with all coordinates in selected column
  def select_column(selection)
    @coordinates.select { |coord_pair| coord_pair[0] == selection - 1 }
  end

  # moved check for full column into own method, still have to write tests for it
  def column_full?(column_arr, board_hash = @board)
    column_arr.all? { |coord_pair| !board_hash[coord_pair].nil? }
  end

  def board_full?
    @board.all? { |_key, value| !value.nil? }
  end

  # returns the first position == nil in column from bottom up
  def find_position(column_arr, hash = @board)
    column_arr.each do |coord_pair|
      return coord_pair if hash[coord_pair].nil?
    end
  end

  def update_position(position, marker)
    @board[position] = marker
  end
end
