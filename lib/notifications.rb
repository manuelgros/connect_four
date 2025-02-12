# frozen_string_literal: true

# Notification module
module Notifications
  player_notification = {
    select_name: "Type in name for Player#{@player_number}: ",
    select_move: "Player#{@player_number}(#{@name}) Select your column: ",
    greet_player: "Hi #{@name}!",
    column_full: 'This column is full! Pick another move'
  }
end
