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

    def top_three
      sorted = sums.sort { |a, z| z <=> a }
      sorted[0..2]
    end

    def part1
      sums.max
    end

    def part2
      top_three.sum
    end
  end
end
