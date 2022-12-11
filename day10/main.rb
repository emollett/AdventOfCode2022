module Day10
  class Main
    attr_accessor :instructions, :interval_values

    def initialize(input)
      @instructions = input.split("\n")
      @interval_values = []
    end

    def loop
      tick = 1
      x = 1
      i = 0
      addx = false
      while tick < 221
        instruction = instructions[i]
        if [20, 60, 100, 140, 180, 220].include?(tick)
          interval_values.push(tick * x)
        end
        if instruction == "noop"
          i += 1
        elsif instruction.split(" ")[0] == "addx" && addx == false
          addx = true
        else instruction.split(" ")[0] == "addx" && addx == true
          number = instruction.split(" ")[1].to_i
          x += number
          i += 1
          addx = false
        end
        tick += 1
      end
      x
    end

    def part1
      loop
      interval_values.sum
    end

    def part2
      nil
    end
  end
end