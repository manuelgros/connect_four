# frozen_string_literal: true

require './lib/player'
require './lib/game_board'
require './lib/notifications'
# Game class including methods for game moves
# and scripts to run game
class Game
  include Notifications

  def initialize
    @player_one = Player.new
    @player_two = Player.new
    @board = GameBoard.new
    @current_player = player_one
  end

  def player_selection(player)
    loop do
      selection = player.select_move
      break selection.to_i if board.column_exist?(selection) && selection.match?(/\A\d+\Z/)

      puts game_notification[:selection_error]
    end
  end

  def check_selection(selection)
    selected_column = board.select_column(selection)
    if board.column_full?(selected_column)
      puts game_notification[:column_full]
      player_selection(current_player)
    else
      selected_column
    end
  end

  def execute_move(selected_column)
    board.update_position(board.find_position(selected_column), current_player.marker)
  end

  def next_player
    @current_player = current_player == player_one ? player_two : player_one
  end
end
