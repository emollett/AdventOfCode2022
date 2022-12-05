require 'rspec'
require_relative 'spec_helper'
require_relative '../day4/main'

describe Day4::Main do
  let(:input) { File.read('./day4/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/day4.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day4::Main.new(test_input) }

    it 'parses the input into rucksacks' do
      expect(puzzle.pairs).to eq(%w[2-4,6-8 2-3,4-5 5-7,7-9 2-8,3-7 6-6,4-6 2-6,4-8])
    end

    it 'splits the pairs up into their constitent parts' do
      expect(puzzle.parse_sections).to eq([[2, 4, 6, 8], [2, 3, 4, 5], [5, 7, 7, 9], [2, 8, 3, 7], [6, 6, 4, 6],
                                           [2, 6, 4, 8]])
    end

    it 'calculates how many pairs completely contain the other' do
      expect(puzzle.part1).to eq(2)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day4::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(500)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
