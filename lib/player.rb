# frozen_string_literal: true

require_relative '../lib/notifications'

# Player class
class Player
  include Notifications

  attr_accessor :player_number
  attr_reader :marker

  def initialize(player_number, marker)
    @player_number = player_number
    @marker = marker
    @name = select_name
    puts player_notification(:greet_player)
  end

  def select_name
    print player_notification(:select_name)
    gets.chomp
  end

  def select_move
    print player_notification(:select_move)
    gets.chomp
  end
end
