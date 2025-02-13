# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# Tests for GameBoard Class
require './lib/game_board'

describe GameBoard do
  describe '#create_coordinates' do
    context 'when initialize the GameBoard class without width/height specifications' do
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

  describe '#column?' do
    context 'when navigating board with width = 7' do
      subject(:game_verify) { described_class.new(7, 6) }

      context 'when selection is insider of width range' do
        it 'returns true' do
          selection = 5
          expect(game_verify.column?(selection)).to be true
        end
      end

      context 'when selection is outside of width range' do
        it 'returns false' do
          selection = 8
          expect(game_verify.column?(selection)).to be false
        end
      end
    end
  end

  describe '#select_column' do
    context 'when navigating board width = 7 and height = 6' do
      subject(:game_column) { described_class.new(7, 6) }

      context 'when selection is 1 returns nested array' do
        selection = 1

        it 'first element is [0, 0]' do
          expect(game_column.select_column(selection).first).to eq([0, 0])
        end

        it 'last element is [0, 5]' do
          expect(game_column.select_column(selection).last).to eq([0, 5])
        end
      end
    end
  end

  describe '#find_position' do
    context 'when given an array with coordinates for column 1' do
      subject(:game_position) { described_class.new }
      let(:column_arr) { [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5]] }

      context 'if the column is empty / all equivalent values in hash are nil' do
        let(:empty_hash) do
          {
            [0, 0] => nil,
            [0, 1] => nil,
            [0, 2] => nil,
            [0, 3] => nil,
            [0, 4] => nil,
            [0, 5] => nil
          }
        end

        it 'returns [0, 0] as available position' do
          expect(game_position.find_position(column_arr, empty_hash)).to eq([0, 0])
        end
      end

      context 'if two positions are taken a already' do
        let(:used_hash) do
          {
            [0, 0] => 'X',
            [0, 1] => 'X',
            [0, 2] => nil,
            [0, 3] => nil,
            [0, 4] => nil,
            [0, 5] => nil
          }
        end

        it 'returns [0, 2] as available position' do
          expect(game_position.find_position(column_arr, used_hash)).to eq([0, 2])
        end
      end
    end
  end

  describe '#column_full?' do
    context 'when given array with all coordinates for a column' do
      subject(:game_full) { described_class.new(7, 6) }
      let(:column_arr) { [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5]] }

      context 'for which board_hash has free values (nil)' do
        let(:free_board) { game_full.board }

        it 'returns false' do
          expect(game_full.column_full?(column_arr, free_board)).to be false
        end
      end

      context 'if all positions in column are already taken' do
        let(:full_board) { game_full.board }

        before do
          column_arr.each { |coord_pair| full_board[coord_pair] = 'X' }
        end

        it 'returns false' do
          expect(game_full.column_full?(column_arr, full_board)).to be true
        end
      end
    end
  end
end
