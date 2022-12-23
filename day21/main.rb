module Day21
  class Main
    attr_accessor :monkeys

    def initialize(input)
      lines = input.split("\n")
      @monkeys = []
      lines.each do |line|
        name = line.split[0].gsub(':', '')
        number = line.delete('^0-9').to_i.zero? ? nil : line.delete('^0-9').to_i
        sub_monkeys = line.scan(/\w+/)[1..-1]
        operator = line.scan(%r{[-+*/]})[0]
        monkeys.push({name: name, number: number, sub_monkeys: sub_monkeys, operator: operator})
      end
    end

    def replace_sub_monkeys
      unvalued_monkeys = monkeys.select { |monkey| monkey[:number].nil? }
      valued_monkeys = monkeys.select { |monkey| !monkey[:number].nil? }
      unvalued_monkeys.cycle do |monkey|
        matches = []
        monkey[:sub_monkeys].each do |sub_monkey|
          match = valued_monkeys.select { | m | m[:name] == sub_monkey }
          matches.push(match) unless match.empty?
        end
        if matches.length == 2
          value = matches[0][0][:number].public_send(monkey[:operator], matches[1][0][:number])
          monkey[:number] = value
          valued_monkeys.push(monkey)
          unvalued_monkeys.delete(monkey)
        end
      end
      valued_monkeys
    end

    def part1
      valued_monkeys = replace_sub_monkeys
      valued_monkeys.select { |m| m[:name] == 'root'}[0][:number]
    end

    def part2
      nil
    end
  end
end
