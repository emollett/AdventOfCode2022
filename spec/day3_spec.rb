require 'rspec'
require_relative 'spec_helper'
require_relative '../day3/main'

describe Day3::Main do
  let(:input) { File.read('./day3/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/day3.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day3::Main.new(test_input) }

    it 'parses the input into rucksacks' do
      expect(puzzle.rucksacks).to eq([["vJrwpWtwJgWr", "hcsFMMfFFhFp"], ["jqHRNqRjqzjGDLGL", "rsFMfFZSrLrFZsSL"], ["PmmdzqPrV", "vPwwTWBwg"], ["wMqvLMZHhHMvwLH", "jbvcjnnSBnvTQFn"], ["ttgJtRGJ", "QctTZtZT"], ["CrZsJsPPZsGz", "wwsLwLmpwMDw"]])
    end

    it 'finds the items in both rucksacks' do
      expect(puzzle.find_matching_item).to eq(['p', 'L', 'P', 'v', 't', 's' ])
    end

    it 'prioritises the items' do
      puzzle.find_matching_item
      expect(puzzle.prioritize).to eq([16, 38, 42, 22, 20, 19])
    end

    it 'sums the values' do
      expect(puzzle.part1).to eq(157)
    end

    it 'gets the groups' do
      expect(puzzle.get_groups).to eq([['vJrwpWtwJgWrhcsFMMfFFhFp', 'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL', 'PmmdzqPrVvPwwTWBwg'], ['wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn', 'ttgJtRGJQctTZtZT', 'CrZsJsPPZsGzwwsLwLmpwMDw']])
    end

    it 'finds the badge in each group' do
      groups = puzzle.get_groups
      expect(puzzle.find_badge(groups)).to eq(['r', 'Z'])
    end

    it 'sums the badge values' do
      expect(puzzle.part2).to eq(70)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { Day3::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(8233)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(2821)
    end
  end
end
