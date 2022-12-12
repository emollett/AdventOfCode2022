require 'rspec'
require_relative 'spec_helper'
require_relative '../day6/main'

describe Day6::Main do
  let(:input) { File.read('./day6/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day6.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the input' do
      expect(puzzle.signal).to eq(%w[b v w b j p l b g v b h s r l p g d m j q w f t v n c z])
    end

    it 'finds the index of the start marker' do
      expect(puzzle.part1).to eq(5)
    end

    it 'finds the index of the start of message marker' do
      expect(puzzle.part2).to eq(23)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(1965)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(2773)
    end
  end
end
