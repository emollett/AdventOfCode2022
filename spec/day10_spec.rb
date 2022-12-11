require 'rspec'
require_relative 'spec_helper'
require_relative '../day10/main'

describe Day10::Main do
  let(:input) { File.read('./day10/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day10.txt') }
  let(:second_test_input) { File.read('./spec/fixtures/day10b.txt') }

  context 'when using the first test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the instructions' do
      expect(puzzle.instructions).to eq(['noop', 'addx 3', 'addx -5'])
    end

    it 'sets x to the right number' do
      expect(puzzle.loop).to eq(-1)
    end
  end

  context 'when using the second test data' do
    let(:puzzle) { described_class.new(second_test_input)}

    it 'gets the value of x at the intervals' do
      puzzle.loop
      expect(puzzle.interval_values).to eq([420, 1140, 1800, 2940, 2880, 3960])
    end

    it 'sums the signal values' do
      expect(puzzle.part1).to eq(13140)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(17940)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
