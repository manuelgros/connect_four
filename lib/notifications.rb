# frozen_string_literal: true

require_relative '../lib/game'
require 'colorize'
# rubocop:disable Metrics/MethodLength

# Notification module
module Notifications
  def player_notification(message)
    {
      select_name: "Type in name for Player #{@player_number}: ".colorize(:yellow),
      select_move: "\nPlayer#{@player_number}(#{@name}) Select your column: ".colorize(:yellow),
      greet_player: 'Welcome '.colorize(:yellow) + "#{@name}\n\n"
    }[message]
  end

  def game_notification(message)
    {
      introduction: "Connect Four is a two-player game where you take
turns dropping colored discs into a vertical grid.
Your goal is to get four in a row—horizontally,
vertically, or diagonally—before your opponent does.
Block their moves while setting up your own to win!\n\nLet's GO!!!...\n".colorize(:blue),
      selection_error: "Your selection is invalid, please select a column
      between 1 and 7".colorize(:red),
      column_full: 'This column is full! Pick another move'.colorize(:red),
      game_over_win: "#{@current_player.name} has won the game! Nice one".colorize(:green),
      game_over_full: 'No more moves left. It looks like a tie'.colorize(:red),
      play_again: 'Do you want to play another round? (Y / N)',
      answer_error: 'Please answer with yes (Y) or no (N)',
      game_end: 'Alright, see you next time!'
    }[message]
  end

  def type_out(text, speed = 0.02)
    text.each_char do |char|
      print char
      sleep(speed)
    end
    puts
    sleep(1)
  end
end
# rubocop:enable Metrics/MethodLength
