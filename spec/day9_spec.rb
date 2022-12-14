require 'rspec'
require_relative 'spec_helper'
require_relative '../day9/main'

describe Day9::Main do
  let(:input) { File.read('./day9/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day9.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the instructions' do
      expect(puzzle.instructions).to eq([%w[R 4], %w[U 4], %w[L 3], %w[D 1], %w[R 4], %w[D 1], %w[L 5], %w[R 2]])
    end

    it 'moves the head and tail' do
      puzzle.move
      expect(puzzle.location).to eq({ head: [2, 2], tail: [1, 2] })
    end

    it 'collects all the places the tail visited' do
      puzzle.move
      expect(puzzle.tail_visited.uniq).to eq(%w[00 10 20 30 41 42 43 34 24 33 32 22 12])
    end

    it 'counts the locations visited' do
      expect(puzzle.part1).to eq(13)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(5878)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
