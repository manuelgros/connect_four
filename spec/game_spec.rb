# frozen_string_literal: true

# Tests for Game class
require './lib/game'

describe Game do
  describe '#getting_player_selection' do
    # Public Script Method -> Not test necessary, but all methods inside sohuld
    # be tested
  end

  describe '#next_player' do
    subject(:game_next_player) { described_class.new }

    context 'when player_one is current_player' do
      it 'changes current_player to player_two' do
        player_one = game_next_player.player_one
        player_two = game_next_player.player_two
        expect { game_next_player.next_player }.to change {
          game_next_player.current_player
        }.from(player_one).to(player_two)
      end
    end

    describe '#execute_move' do
      # Public Script Method -> No test necessary
    end

    describe '#check_for_win?' do
    end

    describe '#four_connected?' do
    end
  end
end
