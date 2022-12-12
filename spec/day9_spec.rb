require 'rspec'
require_relative 'spec_helper'
require_relative '../day9/main'

describe Day9::Main do
  let(:input) { File.read('./day9/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day9.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the instructions' do
    expect(puzzle.instructions).to eq([["R", "4"], ["U", "4"], ["L", "3"], ["D", "1"], ["R", "4"], ["D", "1"], ["L", "5"], ["R", "2"]])
    end

    it 'moves the head and tail' do
      puzzle.move
      expect(puzzle.location).to eq({head: [2,2], tail: [1,2]})
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
