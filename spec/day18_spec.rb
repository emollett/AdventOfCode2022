require 'rspec'
require_relative 'spec_helper'
require_relative '../day18/main'

describe Day18::Main do
  let(:input) { File.read('./day18/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day18.txt') }

  context 'when using the first test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'get the valve info' do
      expect(puzzle.cubes[0]).to eq([2,2,2])
    end

    it 'counts how many shared sides there are' do
      expect(puzzle.get_surface_area).to eq(64)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(4548)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
