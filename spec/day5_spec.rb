require 'rspec'
require_relative 'spec_helper'
require_relative '../day5/main'

describe Day5::Main do
  let(:input) { File.read('./day5/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day5.txt') }

  context 'when using the test data' do
    let(:puzzle) { Day5::Main.new(test_input) }

    it 'splits the instructions from the stacks' do
      expect(puzzle.instructions).to eq([["1", "2", "1"], ["3", "1", "3"], ["2", "2", "1"], ["1", "1", "2"]])
      expect(puzzle.stacks).to eq([nil, ["Z", "N"], ["M", "C", "D"], ["P"]])
    end

    it 'moves boxes between stacks with multiple moving one by one' do
      puzzle.move_boxes_9000
      expect(puzzle.stacks).to eq([nil, ["C"], ["M"], ["P", "D", "N", "Z"]])
    end

    it 'finds the top boxes' do
      expect(puzzle.part1).to eq('CMZ')
    end

    it 'moves boxes between stacks with multiple moving all at once' do
      puzzle.move_boxes_9001
      expect(puzzle.stacks).to eq([nil, ["M"], ["C"], ["P", "Z", "N", "D"]])
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day5::Main.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq("CFFHVVHNC")
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq("FSZWBPTBG")
    end
  end
end
