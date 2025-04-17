# Rendering module for presentation in command line
module Rendering
  def format_row(board_hash, row)
    board_hash.each_with_object('') do |(key, value), string|
      string << value if key[1] == row
      string
    end
  end

  def format_board(board_hash)
    rows = [0, 1, 2, 3, 4, 5]
    rows.reverse.reduce('') do |string, row|
      string << "#{format_row(board_hash, row)}\n"
      string << "\n"
      string
    end
  end

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

  def print_board
    puts format_board(render_marker(@current_board.board))
  end
end
