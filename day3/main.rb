module Day3
  class Main
    attr_accessor :rucksacks
    attr_accessor :matching_items

    def initialize(input)
      @rucksacks = []
      input.split("\n").each do |contents|
        first,second = contents.partition(/.{#{contents.size/2}}/)[1,2]
        rucksacks.push([first, second])
      end
      @matching_items = []
    end

    def find_matching_item
      rucksacks.each do |rucksack|
        matching = rucksack[0].chars & rucksack[1].chars
        matching_items.push(matching[0])
      end
      matching_items
    end

    def prioritize
      values = []
      value_map = ('a'..'z').to_a | ('A'..'Z').to_a
      matching_items.each do |item|
        value = value_map.index(item) + 1  
        values.push(value)
      end
      values
    end

    def part1
      find_matching_item
      prioritize.sum
    end

    def part2;
    end
  end
end
