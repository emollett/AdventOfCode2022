require 'rspec'
require_relative 'spec_helper'
require_relative '../day2/main'

describe Day2::Main do
  let(:input) { File.read('./day2/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/day2.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day2::Main.new(test_input) }

    it 'parses the input into inventory' do
      expect(puzzle.strategy_guide).to eq(["A Y", "B X", "C Z", "A Z", "C X"])
    end

    it 'gets the score for each hand' do
      expect(puzzle.get_hand_scores).to eq([8, 1, 6, 3, 7])
    end

    it 'calculates your total score' do
      expect(puzzle.part1).to eq(25)
    end

    it 'gets your hand' do
      expect(puzzle.get_hand).to eq(["A X", "B X", "C X", "A Y", "C Y"])
    end

    it 'calculates your total score' do
      expect(puzzle.part2).to eq(22)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day2::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(10718)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(14652)
    end
  end
end
