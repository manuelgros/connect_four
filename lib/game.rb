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
    @current_turn = player_one
  end

  def player_move(player)
    loop do
      move = player.select_move
      break move.to_i if board.column_exist?(move) && move.match?(/\A\d+\Z/)

      game_notification(:selection_error)
    end
  end
end
