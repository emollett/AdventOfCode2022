module Day5
  class Main
    attr_accessor :instructions, :stacks

    def initialize(input)
      @instructions = input.split("\n\n")[1].split("\n").map { |a| a.gsub(/[a-z]/, '').split }
      stacking = []
      rows = input.split("\n\n")[0].split("\n")
      rows.each do |row|
        row.each_char.with_index do |character, i|
          if character.match(/[A-Z]/)
            pos = (i + 3) / 4
            stacking[pos] ||= []
            stacking[pos].unshift(character)
          end
        end
      end
      @stacks = stacking
    end

    def move_boxes_9000
      instructions.each do |instruction|
        boxes_to_move = instruction[0].to_i
        start_stack = instruction[1].to_i
        end_stack = instruction[2].to_i
        boxes_to_move.times do
          stacks[end_stack].push(stacks[start_stack].pop)
        end
      end
    end

    def move_boxes_9001
      instructions.each do |instruction|
        boxes_to_move = instruction[0].to_i
        start_stack = instruction[1].to_i
        end_stack = instruction[2].to_i
        stacks[end_stack].push(*stacks[start_stack].pop(boxes_to_move))
      end
    end

    def part1
      move_boxes_9000
      crates = ""
      stacks.each do |stack|
        if stack != nil
          crates = crates + stack.pop
        end
      end
      crates
    end

    def part2
      move_boxes_9001
      crates = ""
      stacks.each do |stack|
        if stack != nil
          crates = crates + stack.pop
        end
      end
      crates
    end
  end
end
