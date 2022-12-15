require 'rspec'
require_relative 'spec_helper'
require_relative '../day7/main'

describe Day7::Main do
  let(:input) { File.read('./day7/input.txt') }
  let(:test_input) { File.read('./spec/fixtures/day7.txt') }

  context 'when using the test data' do
    let(:puzzle) { described_class.new(test_input) }

    it 'gets the directories' do
      expect(puzzle.directories).to eq(["dir a", "dir d", "dir e"])
    end

    it 'gets the directory contents' do
      expect(puzzle.directory_contents).to eq([[], 
      [" /", "$ ls", "dir a", "14848514 b.txt", "8504156 c.dat", "dir d"], 
      [" a", "$ ls", "dir e", "29116 f", "2557 g", "62596 h.lst"], 
      [" e", "$ ls", "584 i"],
      [" .."], 
      [" .."], 
      [" d", "$ ls", "4060174 j", "8033020 d.log", "5626152 d.ext", "7214296 k"]])
    end

    it 'gets the sizes of the directories' do
      expect(puzzle.calculate_all_directories).to eq([94853, 24933642, 584])
    end

    it 'adds up the big directories' do
      expect(puzzle.part1).to eq(95437)
    end

    # it 'deals with directories of the same name' do
    #   expect(puzzle.directories.unique.size).to eq(puzzle.directories.size)
    # end
  end

  context 'when using the real data' do
    let(:puzzle) { described_class.new(input) }

    # failing because it finds a higher up directory?
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(nil)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(nil)
    end
  end
end
