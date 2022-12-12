require 'rspec'
require_relative 'spec_helper'
require_relative '../day11/main'

describe Day11::Main do
  let(:input) { File.read('./day11/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day11.txt') }

  context 'when using the first test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the monkeys' do
      puzzle.starting_monkeys
      expect(puzzle.monkeys[0]).to eq({ ifFalse: 3, ifTrue: 2, items: [79, 98], items_inspected: 0, name: 'Monkey 0',
                                        operation_value: "19", operator: '*', test: 23 })
    end

    it 'takes a turn' do
      puzzle.starting_monkeys
      puzzle.take_turns(1)
      expect(puzzle.monkeys[0][:items]).to eq([20, 23, 27, 26])
      expect(puzzle.monkeys[1][:items]).to eq([2080, 25, 167, 207, 401, 1046])
    end

    it 'takes 20 turns' do
      puzzle.starting_monkeys
      puzzle.take_turns(20)
      expect(puzzle.monkeys[0][:items]).to eq([10, 12, 14, 26, 34])
      expect(puzzle.monkeys[1][:items]).to eq([245, 93, 53, 199, 115])
    end

    it 'counts how many times monkeys have inspected items' do
      puzzle.starting_monkeys
      puzzle.take_turns(20)
      expect(puzzle.monkeys[0][:items_inspected]).to eq(101)
    end

    it 'multiplies the top two monkeys' do
      expect(puzzle.part1).to eq(10605)
    end

    it 'gets really big' do
      expect(puzzle.part2).to eq(2713310158)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(107822)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(27267163742)
    end
  end
end
