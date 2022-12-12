module Day11
  class Main
    attr_accessor :monkey_input, :monkeys, :worry_reduction

    def initialize(input)
      @monkey_input = input.split("\n\n").map { |a| a.split("\n") }
      @monkeys = []
      @worry_reduction = 1
    end

    def starting_monkeys
      monkey_input.each do |monkey|
        name = monkey[0].gsub(":", "")
        items = monkey[1].scan(/\d+/).map(&:to_i)
        operator = monkey[2].gsub('Operation: new = old ', '').split[0]
        operation_value = monkey[2].gsub('Operation: new = old ', '').split[1]
        test = monkey[3].scan(/\d+/)[0].to_i
        ifTrue = monkey[4].scan(/\d+/)[0].to_i
        ifFalse = monkey[5].scan(/\d+/)[0].to_i
        items_inspected = 0
        monkeys.push({ name: name, items: items, operator: operator, operation_value: operation_value, test: test, ifTrue: ifTrue, ifFalse: ifFalse, items_inspected: items_inspected })
      end
    end

    def take_turns(turns)
      # This reduces the worry number which would otherwise get too high
      # By picking the lowest common multiple of the test values, the test to see if it is still divisible still works
      # With thanks to other peoples examples!
      lowest_common_multiple = monkeys.map{|x| x[:test]}.reduce(1, :lcm)
      
      turns.times do
        monkeys.each do |monkey|
          monkey[:items].each do |item|
            monkey[:operation_value] == 'old' ? value = item : value = monkey[:operation_value].to_i
            item = item.public_send(monkey[:operator], value) % lowest_common_multiple
            item = item / worry_reduction
            if item % monkey[:test] == 0
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
      @worry_reduction = 3
      starting_monkeys
      take_turns(20)
      inspected = monkeys.map{|x| x[:items_inspected]}.sort.reverse
      inspected[0] * inspected[1]
    end

    def part2
      @worry_reduction = 1
      starting_monkeys
      take_turns(10000)
      inspected = monkeys.map{|x| x[:items_inspected]}.sort.reverse
      inspected[0] * inspected[1]
    end
  end
end
