require 'rspec'
require_relative 'spec_helper'
require_relative '../day21/main'

describe Day21::Main do
  let(:input) { File.read('./day21/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day21.txt') }

  context 'when using the first test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'get the monkey info' do
      expect(puzzle.monkeys[0]).to eq({name: 'root:', number: nil, operator: '+', sub_monkeys: %w[pppw sjmn] })
    end

    it 'replaces the submonkeys' do
      expect(puzzle.replace_sub_monkeys.length).to eq(puzzle.monkeys.length)
    end

    it 'gets the root value' do
      expect(puzzle.part1).to eq(152)
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
