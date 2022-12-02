module Day1
  class Main
    attr_accessor :inventory

    def initialize(input)
      @inventory = input.split("\n\n")
    end

    def sums
      sums = []
      inventory.each do |elf|
        calories = elf.split("\n").map(&:to_i)
        sums.push(calories.sum)
      end
      sums
    end

    def part1
      sums.max
    end

    def part2; end
  end
end
