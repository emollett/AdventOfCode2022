require 'rspec'
require_relative 'spec_helper'
require_relative '../day1/main'

describe Day1::Main do
  let(:input) { File.read('./day1/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/day1.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day1::Main.new(test_input) }

    it 'parses the input into inventory' do
      expect(puzzle.inventory).to eq(%W[1000\n2000\n3000 4000 5000\n6000 7000\n8000\n9000 10000])
    end

    it 'sums each elfs inventory' do
      expect(puzzle.sums).to eq([6000, 4000, 11_000, 24_000, 10_000])
    end

    it 'returns the highest calories' do
      expect(puzzle.part1).to eq(24_000)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day1::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(68_292)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
