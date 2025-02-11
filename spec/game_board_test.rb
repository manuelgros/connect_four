# frozen_string_literal: true

# Tests for GameBoard Class
require './lib/game_board'

describe GameBoard do
  describe '#create_coordinates' do
    context 'when initialize the GameBoard class' do
      subject(:game_coordinates) { described_class.new }

      it 'creates an nested array with 42 elements' do
        expect(game_coordinates.coordinates.size).to eq(42)
      end

      it 'has [0, 0] as first element' do
        expect(game_coordinates.coordinates.first).to eq([0, 0])
      end

      it 'has [6, 7] as last element' do
        expect(game_coordinates.coordinates.last).to eq([6, 5])
      end
    end
  end

  describe '#create_board' do
    context 'when given array with coordinates' do
      subject(:game_board) { described_class.new }
      let(:array) { game_board.coordinates }

      it 'returns hash with [0, 0] as first key' do
        expect(game_board.create_board(array).first[0]).to eq([0, 0])
      end

      it 'returns hash with [6, 5] as last key' do
        expect(game_board.create_board(array).keys.last).to eq([6, 5])
      end

      it 'returns hash with all values nil' do
        expect(game_board.create_board(array).values).to all(be_nil)
      end
    end
  end
end
