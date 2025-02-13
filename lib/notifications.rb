# frozen_string_literal: true

# rubocop:disable Lint/UselessAssignment

# Notification module
module Notifications
  player_notification = {
    select_name: "Type in name for Player#{@player_number}: ",
    select_move: "Player#{@player_number}(#{@name}) Select your column: ",
    greet_player: "Hi #{@name}!",
    column_full: 'This column is full! Pick another move'
  }

  game_notification = {
    selection_error: "Your selection is invalid, please select a column
    between 1 and #{board.width}"
  }
end
