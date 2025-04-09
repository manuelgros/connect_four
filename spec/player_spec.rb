# frozen_string_literal: true

# Tests for Player
require './lib/player'
require './lib/notifications'

describe Player do
  describe '#select_name' do
    subject(:player_input) { described_class.new('1', 'X') }

    context 'when given an valid player name' do
      before do
        valid_name = 'Bob'
        allow(player_input).to receive(:player_notification)
        allow(player_input).to receive(:gets).and_return(valid_name)
      end

      it 'returns the valid_name' do
        expect(player_input).to eql(valid_name)
        player_input.select_name
      end
    end
  end
end
