module Day3
  class Main
    attr_accessor :rucksacks
    attr_accessor :matching_items

    def initialize(input)
      @rucksacks = []
      input.dup.split("\n").each do |contents|
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

    def get_groups
      i=0
      groups = []
      while i < rucksacks.size do
        group = []
        group.push(rucksacks[i][0] << rucksacks[i][1], rucksacks[i+1][0] << rucksacks[i+1][1], rucksacks[i+2][0] << rucksacks[i+2][1])
        groups.push(group)
        i = i+3
      end
      groups
    end

    def find_badge(groups)
      groups.each do |group|
        matching = group[0].chars & group[1].chars & group[2].chars
        matching_items.push(matching[0])
      end
      matching_items
    end

    def part1
      find_matching_item
      prioritize.sum
    end

    def part2
      find_badge(get_groups)
      prioritize.sum
    end
  end
end
