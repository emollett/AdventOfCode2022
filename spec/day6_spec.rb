require 'rspec'
require_relative 'spec_helper'
require_relative '../day6/main'

describe Day6::Main do
  let(:input) { File.read('./day6/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day6.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the input' do
      expect(puzzle.signal).to eq('bvwbjplbgvbhsrlpgdmjqwftvncz')
    end

    it 'finds the index of the start marker' do
      expect(puzzle.find_start_marker).to eq(5)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(1965)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
