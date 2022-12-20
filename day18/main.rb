module Day18
  class Main
    attr_accessor :cubes

    def initialize(input)
      @cubes = input.split("\n").map { |l| l.split(",").map(&:to_i)}
    end

    def false.to_i
      0
    end

    def true.to_i
      1
    end

    def get_surface_area
      shared = 0
      combinations = cubes.combination(2)
      combinations.each do |combo|
        common = (combo[0][0] == combo[1][0]).to_i + (combo[0][1] == combo[1][1]).to_i + (combo[0][2] == combo[1][2]).to_i
        dif = (combo[0][0] - combo[1][0]).abs + (combo[0][1] - combo[1][1]).abs + (combo[0][2] - combo[1][2]).abs
        shared += 1 if common == 2 && dif == 1
      end
      (cubes.length * 6) - (shared * 2)
    end

    def part1
      get_surface_area
    end

    def part2
      nil
    end
  end
end
