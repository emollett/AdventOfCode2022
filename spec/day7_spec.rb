require 'rspec'
require_relative 'spec_helper'
require_relative '../day7/main'

describe Day7::Main do
  let(:input) { File.read('./day7/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day7.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the directory contents' do
      expect(puzzle.directory_contents).to eq(['$ cd /', '$ ls', 'dir a', '14848514 b.txt', '8504156 c.dat', 'dir d',
                                               '$ cd a', '$ ls', 'dir e', '29116 f', '2557 g', '62596 h.lst',
                                               '$ cd e', '$ ls', '584 i',
                                               '$ cd ..',
                                               '$ cd ..',
                                               '$ cd d', '$ ls', '4060174 j', '8033020 d.log', '5626152 d.ext', '7214296 k'])
    end

    it 'works its way through the directories' do
      puzzle.scan_directory
      expect(puzzle.directory_stack).to eq(['$ cd /', '$ cd d'])
      expect(puzzle.file_size_stack).to eq([48_381_165, 24_933_642])
    end

    it 'gets the sizes of the directories' do
      puzzle.scan_directory
      expect(puzzle.complete_directory_sizes).to eq([584, 94_853, 48_381_165, 24_933_642])
    end

    it 'adds up the big directories' do
      expect(puzzle.part1).to eq(95_437)
    end

  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(1_844_187)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
