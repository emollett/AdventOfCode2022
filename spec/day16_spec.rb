require 'rspec'
require_relative 'spec_helper'
require_relative '../day16/main'

describe Day16::Main do
  let(:input) { File.read('./day16/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day16.txt') }

  context 'when using the first test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'get the valve info' do
      expect(puzzle.valves[0]).to eq({ child_valves: %w[DD II BB], flow_rate: 0, parent_valve: 'AA', isOpen?: false })
    end

    it 'calculates potential paths' do
      expect(puzzle.calculate_possible_paths(2)).to eq([['AA', 'DD', 20, 'CC', 2], ['AA', 'DD', 20, 'AA'],
                                                        ['AA', 'DD', 20, 'EE', 3], ['AA', 'II', 'AA'],
                                                        ['AA', 'II', 'JJ', 21], ['AA', 'BB', 13, 'CC', 2],
                                                        ['AA', 'BB', 13, 'AA']])
    end

    it 'finds the highest flow you can achieve' do
      expect(puzzle.part1).to eq(1651)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'check if there are duplicates' do
      expect(puzzle.valves.map { |a| a[:parent_valve] }.size).to eq(puzzle.valves.map do |a|
                                                                      a[:parent_valve]
                                                                    end.uniq.size)
    end

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(nil)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
