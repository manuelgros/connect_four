# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/game_board'
require_relative '../lib/notifications'
require_relative '../lib/rendering'

# Game class including methods for game moves and scripts to run game
class Game
  include Notifications
  include Rendering

  attr_reader :current_player, :current_board, :player_one, :player_two

  def initialize
    @current_board = GameBoard.new
    @player_one = Player.new('1', '1')
    @player_two = Player.new('2', '2')
    @current_player = player_one
  end

  def getting_player_selection(player)
    loop do
      selection = player.select_move
      if current_board.column_exist?(selection) && selection.match?(/\A\d+\Z/)
        break current_board.select_column(selection)
      end

      puts game_notification(:selection_error)
    end
  end

  def next_player
    @current_player = current_player == player_one ? player_two : player_one
  end

  def execute_move(player)
    selected_column = getting_player_selection(player)
    if current_board.column_full?(selected_column)
      puts game_notification(:column_full)
      execute_move(player)
    else
      current_board.update_position(current_board.find_position(selected_column), player.marker)
    end
  end

  def check_for_win?
    directions = [[0, 1], [1, 1], [1, 0]]
    current_board.board.each_pair do |start_position, symbol|
      next if symbol.nil?

      directions.each { |direction| return true if four_connected?(start_position, direction) }
    end
    false
  end

  def four_connected?(start_position, direction, streak = 1)
    return true if streak == 4

    neighbor = start_position.map.with_index { |num, idx| num + direction[idx] }

    if current_board.board[start_position] == current_board.board[neighbor]
      four_connected?(neighbor, direction, streak + 1)
    else
      false
    end
  end

  def play_full_round
    type_out(game_notification(:introduction))
    print_board
    loop do
      execute_move(@current_player)
      print_board

      break if check_for_win? || current_board.board_full?

      next_player
    end
    return puts game_notification(:game_over_win) if check_for_win?

    puts game_notification(:game_over_full)
  end
end
