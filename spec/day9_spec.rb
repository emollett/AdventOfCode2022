require 'rspec'
require_relative 'spec_helper'
require_relative '../day9/main'

describe Day9::Main do
  let(:input) { File.read('./day9/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day9.txt') }

  context 'when using the test data and two knots' do
    let(:puzzle) { described_class.new(test_input, 2) }

    it 'gets the instructions' do
      expect(puzzle.instructions).to eq([%w[R 4], %w[U 4], %w[L 3], %w[D 1], %w[R 4], %w[D 1], %w[L 5], %w[R 2]])
    end

    it 'moves the head and tail' do
      puzzle.move
      expect(puzzle.knots).to eq([[2, 2], [1, 2]])
    end

    it 'collects all the places the tail visited' do
      puzzle.move
      expect(puzzle.tail_visited.uniq).to eq(%w[0,0 1,0 2,0 3,0 4,1 4,2 4,3 3,4 2,4 3,3 3,2 2,2 1,2])
    end

    it 'counts the locations visited' do
      expect(puzzle.answer).to eq(13)
    end
  end

  context 'when using the test data and 10 knots' do
    let(:puzzle) { described_class.new(test_input, 10) }

    it 'moves the knots' do
      puzzle.move
      expect(puzzle.knots).to eq([[2, 2], [1, 2], [2, 2], [3, 2], [2, 2], [1, 1], [0, 0], [0, 0], [0, 0], [0, 0]])
    end

    it 'counts the locations visited' do
      expect(puzzle.answer).to eq(1)
    end
  end

  context 'when using the real data and 2 knots' do
    let(:puzzle) { described_class.new(input, 2) }

    it 'returns the answer to part 1' do
      expect(puzzle.answer).to eq(5878)
    end
  end

  context 'when using the real data and 10 knots' do
    let(:puzzle) { described_class.new(input, 10) }

    it 'returns the answer to part 2' do
      expect(puzzle.answer).to eq(2405)
    end
  end
end
