require 'colorize'

# Rendering module for presentation in command line
module Rendering
  # Merges all values of Hash that belong to certain row into a string
  def format_row(board_hash, row)
    board_hash.each_with_object('') do |(key, value), string|
      string << value if key[1] == row
      string
    end
  end

  # Calls the format_row method for all existing rows and combines them in single string
  def format_board(board_hash)
    rows = [0, 1, 2, 3, 4, 5]
    rows.reverse.reduce('') do |string, row|
      string << "#{format_row(board_hash, row)}\n"
      string
    end
  end

  # Takes the board hash and replaces all value with more visual pleasing marker for display
  def render_marker(hash)
    hash.each_with_object({}) do |(key, value), new_hash|
      if value.nil?
        new_hash[key] = ' 🔳 '
      elsif value == '1'
        new_hash[key] = ' 🔴 '
      elsif value == '2'
        new_hash[key] = ' 🟡 '
      end
      new_hash
    end
  end

  # Script to format and then print the entire playing board.
  def print_board
    puts format_board(render_marker(@current_board.board))
    puts ' 1   2   3   4   5   6   7 '.colorize(:red)
  end
end
