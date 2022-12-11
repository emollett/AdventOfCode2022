module Day10
  class Main
    attr_accessor :instructions, :interval_values, :crt

    def initialize(input)
      @instructions = input.split("\n")
      @interval_values = []
      @crt = []
    end

    def loop
      tick = 1
      x = 1
      i = 0
      addx = false
      crt_row = ''
      while tick < 241
        instruction = instructions[i]
        crt_row = draw_picture(tick, x, crt_row)
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

    def draw_picture(tick, x, crt_row)
      pixel = (tick-1) % 40
      sprite = [x-1, x, x+1]
      sprite.include?(pixel) ? lit = '#' : lit = '.'
      crt_row += lit
      if tick % 40 == 0
        crt.push(crt_row)
        crt_row = ''
      end
      crt_row
    end

    def part1
      loop
      interval_values.sum
    end

    def part2
      loop
      pp crt
      crt
    end
  end
end