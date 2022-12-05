module Day4
  class Main
    attr_accessor :pairs

    def initialize(input)
      @pairs = input.split("\n")
    end

    def parse_sections
      sections = []
      pairs.each do |pair|
        sections.push(pair.split(/[\s,-]/).map(&:to_i))
      end
      sections
    end

    def part1
      sections = parse_sections
      contained_count = 0
      sections.each do |section|
        if (section[0] <= section[2] && section[1] >= section[3]) || (section[2] <= section[0] && section[3] >= section[1])
          contained_count += 1
        end
      end
      contained_count
    end

    def part2
      sections = parse_sections
      uncontained_count = 0
      sections.each do |section|
        if (section[0] < section[2] && section[1] < section[2]) || (section[0] > section[3] && section[1] > section[3])
          uncontained_count += 1
        end
      end
      sections.size - uncontained_count
    end
  end
end
