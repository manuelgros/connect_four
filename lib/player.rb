# frozen_string_literal: true

require './lib/notifications'

# Player class
class Player
  attr_accessor :player_number

  include Notifications

  def initialize(marker)
    @name = select_name
    @player_number = nil
    @marker = marker
  end

  def select_name
    print player_notification(:get_name)
    gets.chomp
    puts player_notification(:greet_player)
  end

  def select_move
    print player_notification(:select_move)
    gets.chomp
  end
end
