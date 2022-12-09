require 'rspec'
require_relative 'spec_helper'
require_relative '../day8/main'

describe Day8::Main do
  let(:input) { File.read('./day8/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day8.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the trees' do
      expect(puzzle.trees).to eq([["3", "0", "3", "7", "3"], ["2", "5", "5", "1", "2"], ["6", "5", "3", "3", "2"], ["3", "3", "5", "4", "9"], ["3", "5", "3", "9", "0"]])
    end

    it 'gets the rotated trees' do
      expect(puzzle.rotated_trees).to eq([["3", "2", "6", "3", "3"], ["0", "5", "5", "3", "5"], ["3", "5", "3", "5", "3"], ["7", "1", "3", "4", "9"], ["3", "2", "2", "9", "0"]])
    end

    it 'counts the exterior trees' do
      expect(puzzle.count_exterior).to eq(16)
    end

    it 'counts the interior trees' do
      expect(puzzle.count_interior).to eq(5)
    end

    it 'gets the big trees' do
      expect(puzzle.part1).to eq(21)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(nil)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
