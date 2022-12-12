module Day11
  class Main
    attr_accessor :monkey_input, :monkeys

    def initialize(input)
      @monkey_input = input.split("\n\n").map { |a| a.split("\n") }
      @monkeys = []
    end

    def starting_monkeys
      monkey_input.each do |monkey|
        name = monkey[0].gsub(":", "")
        items = monkey[1].scan(/\d+/).map(&:to_i)
        operator = monkey[2].gsub('Operation: new = old ', '').split[0]
        operation_value = monkey[2].gsub('Operation: new = old ', '').split[1].to_i
        test = monkey[3].scan(/\d+/)[0].to_i
        ifTrue = monkey[4].scan(/\d+/)[0].to_i
        ifFalse = monkey[5].scan(/\d+/)[0].to_i
        items_inspected = 0
        monkeys.push({ name: name, items: items, operator: operator, operation_value: operation_value, test: test, ifTrue: ifTrue, ifFalse: ifFalse, items_inspected: items_inspected })
      end
    end

    def take_turns(turns)
      turns.times do
        monkeys.each do |monkey|
          monkey[:items].each do |item|
            item = item.public_send(monkey[:operator], monkey[:operation_value])
            item = item / 3
            if (item % monkey[:test]).zero?
              monkeys.select{|m| m[:name] == "Monkey #{monkey[:ifTrue]}"}[0][:items].push(item)
            else
              monkeys.select{|m| m[:name] == "Monkey #{monkey[:ifFalse]}"}[0][:items].push(item)
            end
          end
          monkey[:items_inspected] = monkey[:items_inspected] + monkey[:items].size
          monkey[:items] = []
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
