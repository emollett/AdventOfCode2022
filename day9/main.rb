module Day9
  class Main
    attr_accessor :instructions, :knots, :tail_visited

    def initialize(input, number_of_knots)
      @instructions = input.split("\n").map(&:split)
      @knots = Array.new(number_of_knots) { Array.new(2, 0) }
      @tail_visited = ['0,0']
    end

    def move
      instructions.each do |instruction|
        instruction[1].to_i.times do
          move_head(instruction)
          move_tail
          tail_visited.push("#{knots[-1][0]},#{knots[-1][1]}")
        end
      end
    end

    def move_head(instruction)
      case instruction[0]
      when 'U'
        knots[0][1] += 1
      when 'D'
        knots[0][1] -= 1
      when 'R'
        knots[0][0] += 1
      when 'L'
        knots[0][0] -= 1
      end
    end

    def move_tail
      knots.each_index do |i|
        next if i.zero?

        x_distance = knots[i - 1][0] - knots[i][0]
        y_distance = knots[i - 1][1] - knots[i][1]
        distance = Math.sqrt(x_distance.pow(2) + y_distance.pow(2))
        if distance == 2
          if x_distance.nonzero?
            knots[i][0] += x_distance.positive? ? 1 : -1
          end
          if y_distance.nonzero?
            knots[i][1] += y_distance.positive? ? 1 : -1
          end
        elsif distance > 2
          #  diagonal move
          knots[i][0] += x_distance.positive? ? 1 : -1
          knots[i][1] += y_distance.positive? ? 1 : -1
        end
      end
    end

    def answer
      move
      tail_visited.uniq.length
    end
  end
end
