module Day9
  class Main
    attr_accessor :instructions, :location, :tail_visited

    def initialize(input)
      @instructions = input.split("\n").map(&:split)
      @location = { head: [0, 0], tail: [0, 0] }
      @tail_visited = ['0,0']
    end

    def move
      instructions.each do |instruction|
        instruction[1].to_i.times do
          # move the head
          move_head(instruction)

          move_tail
          tail_visited.push("#{location[:tail][0]},#{location[:tail][1]}")
        end
      end
    end

    def move_head(instruction)
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
    end

    def move_tail
      x_distance = location[:head][0] - location[:tail][0]
      y_distance = location[:head][1] - location[:tail][1]
      distance = Math.sqrt(x_distance.pow(2) + y_distance.pow(2))
      if distance == 2
        if x_distance.nonzero?
          location[:tail][0] += x_distance.positive? ? 1 : -1
        end
        if y_distance.nonzero?
          location[:tail][1] += y_distance.positive? ? 1 : -1
        end
      elsif distance > 2
        #  diagonal move
        location[:tail][0] += x_distance.positive? ? 1 : -1
        location[:tail][1] += y_distance.positive? ? 1 : -1
      end
    end

    def part1
      move
      tail_visited.uniq.length
    end

    def part2
      nil
    end
  end
end
