# frozen_string_literal: true

require './lib/player'
require './lib/game_board'
require './lib/notifications'
# Game class including methods for game moves
# and scripts to run game
class Game
  include Notifications

  attr_reader :current_player, :board, :player_one, :player_two

  def initialize
    @board = GameBoard.new
    @player_one = Player.new(board.white_tile)
    @player_two = Player.new(board.black_tile)
    @current_player = player_one
  end

  def getting_player_selection(player)
    loop do
      selection = player.select_move
      break selection.to_i if board.column_exist?(selection) && selection.match?(/\A\d+\Z/)

      puts game_notification[:selection_error]
    end
  end

  def next_player
    @current_player = current_player == player_one ? player_two : player_one
  end

  def execute_move(player)
    selected_column = getting_player_selection(player)
    if board.column_full?(selected_column)
      puts game_notification[:column_full]
      execute_move(player)
    else
      check_column(selected_column)
      board.update_position(board.find_position(selected_column), player.marker)
    end
  end

  def check_for_win?
    # neighbors = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
    directions = [[0, 1], [1, 1], [1, 0]]
    @coordinates.each do |start_position|
      directions.each { |direction| four_connected?(start_position, direction) }
    end
  end

  def four_connected?(start_position, direction, streak = 1)
    return true if streak == 4

    neighbor = start_position.map.with_index { |num, idx| num + direction[idx] }

    if board[start_position] == board[neighbor]
      four_connected?(neighbor, direction, streak + 1)
    else
      false
    end
  end

  def play_full_round
    until check_for_win? || board.board_full?
      execute_move(@current_player)
      next_player
    end
    return puts game_notification[:game_over_win] if check_for_win?

    puts game_notification[:game_over_full]
  end
end
