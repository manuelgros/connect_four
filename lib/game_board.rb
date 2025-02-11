# frozen_string_literal: true

# Class for the game board (size 7 wide and 6 high)
class GameBoard
  attr_reader :coordinates

  def initialize
    @coordinates = create_coordinates
    @board = {}
    @white_tile = "\u26AA"
    @black_tile = "\u26AB"
  end

  def create_coordinates
    x_coord = Array(0..6)
    y_coord = Array(0..5)
    x_coord.each_with_object([]) do |first_ele, coord_arr|
      y_coord.each { |second_ele| coord_arr << [first_ele, second_ele] }
      coord_arr
    end
  end

  def create_board(coord_arr)
    coord_arr.each_with_object({}) do |coord, hash|
      hash[coord] = nil
      hash
    end
  end

  def select_field(column)
  end
end
