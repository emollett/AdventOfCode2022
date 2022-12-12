module Day9
  class Main
    attr_accessor :instructions, :location

    def initialize(input)
      @instructions = input.split("\n").map{|i| i.split}
      @location = {head: [0,0], tail: [0,0]}
    end

    def move
      instructions.each do |instruction|
        instruction[1].to_i.times do
          # move the head
          case instruction[0]
          when 'U'
            location[:head][1] += 1
          when 'D'
            location[:head][1] -= 1
          when 'R'
            location[:head][0] += 1
          when 'L'
            location[:head][0] -= 1
          end

          # move the tail
          if (location[:head][0] - location[:tail][0]).abs > 1 && (location[:head][1] - location[:tail][1]) != 0
            # only needs to move by one, not two
            location[:tail][0] += (location[:head][0] - location[:tail][0])
            location[:tail][1] += (location[:head][1] - location[:tail][1])
          elsif (location[:head][1] - location[:tail][1]).abs > 1 && (location[:head][0] - location[:tail][0]) != 0
            # only needs to move by one, not two
              location[:tail][0] += (location[:head][0] - location[:tail][0])
              location[:tail][1] += (location[:head][1] - location[:tail][1])
          elsif (location[:head][0] - location[:tail][0]).abs  > 1
            location[:tail][0] += (location[:head][0] - location[:tail][0])
          elsif (location[:head][1] - location[:tail][1]) > 1
            location[:tail][1] += (location[:head][1] - location[:tail][1])
          end

        end
      end
    end

    def part1
      nil
    end

    def part2
      nil
    end
  end
end
