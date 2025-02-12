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
  end
end
