# frozen_string_literal: true

# rubocop:disable Lint/UselessAssignment

# Notification module
module Notifications
  player_notification = {
    select_name: "Type in name for Player#{@player_number}: ",
    select_move: "Player#{@player_number}(#{@name}) Select your column: ",
    greet_player: "Hi #{@name}!"
  }

  game_notification = {
    introduction: 'Connect Four is a two-player game where you take
    turns dropping colored discs into a vertical grid.
    Your goal is to get four in a row—horizontally,
    vertically, or diagonally—before your opponent does.
    Block their moves while setting up your own to win!',
    selection_error: "Your selection is invalid, please select a column
    between 1 and #{board.width}",
    column_full: 'This column is full! Pick another move',
    game_over_win: "#{current_player} has won the game! Nice one",
    game_over_full: 'No more moves left. It looks like a tie'
  }
end
