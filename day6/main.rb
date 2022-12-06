module Day6
  class Main
    attr_accessor :signal

    def initialize(input)
      @signal = input
    end

    def find_start(size)
      signal_array = signal.chars
      signal_array.to_enum.with_index(size - 1) do |_c, i|
        quartet = signal_array[i - (size - 1)..i]
        return i + 1 if quartet.uniq.size == size
      end
      nil
    end

    def part1
      find_start(4)
    end

    def part2
      find_start(14)
    end
  end
end
