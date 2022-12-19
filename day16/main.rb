require 'json'

module Day16
  class Main
    attr_accessor :valves, :seconds, :paths

    def initialize(input)
      @valves = []
      lines = input.split("\n")
      lines.each do |line|
        parent_valve = line[/[A-Z]{2}/]
        flow_rate = line.delete("^0-9").to_i
        child_valves = line.scan(/[A-Z]{2}/)[1..-1]
        valves.push({parent_valve: parent_valve, flow_rate: flow_rate, child_valves: child_valves, isOpen?: false})
      end
      @seconds = 0
      @paths = []
    end

    def calculate_possible_paths(length)
      starting_valve = 'AA'
      paths = [[starting_valve]]
      length.times do
        paths.each do |path|
          paths += add_next_valves(path)
          paths.delete(path)
        end
        pp paths
      end
      paths
    end

    def add_next_valves(path)
      current_valve = Integer(path[-1], exception: false) ? path[-2] : path[-1]
      new_paths = []
      child_valves = valves.find { |valve| valve[:parent_valve] == current_valve } ? valves.find { |valve| valve[:parent_valve] == current_valve }[:child_valves] : []
      child_valves.each do |child|
        valve = valves.find { |valve| valve[:parent_valve] == child }
        new_path = if path.include?(child) || (valve[:flow_rate]).zero?
                     path.length < 30 ? path.dup.push(child) : path
                   else
                     path.length < 29 ? path.dup.push(child, valve[:flow_rate]) : path
                   end
        new_paths.push(new_path)
      end
      new_paths
    end

    def part1
      paths = calculate_possible_paths(30)
      paths.map { |path| path.select { |a| Integer(a, exception: false) }.sum }.max
    end

    def part2
      nil
    end
  end
end
