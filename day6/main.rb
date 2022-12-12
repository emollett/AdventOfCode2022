module Day6
  class Main
    attr_accessor :signal

    def initialize(input)
      @signal = input.chars
    end

    def find_start(size)
      signal.to_enum.with_index(size - 1) do |_c, i|
        sequence = signal[i - (size - 1)..i]
        return i + 1 if sequence.uniq.size == size
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
