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

  def player_selection(player)
    loop do
      selection = player.select_move
      break selection.to_i if board.column_exist?(selection) && selection.match?(/\A\d+\Z/)

      game_notification(:selection_error)
    end
  end

  def execute_move(selection)
end
