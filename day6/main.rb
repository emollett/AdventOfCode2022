module Day6
  class Main
    attr_accessor :signal

    def initialize(input)
      @signal = input
    end

    def find_start_marker
      signal_array = signal.chars
      signal_array.to_enum.with_index(3) do |_c, i|
        quartet = [signal_array[i], signal_array[i - 1], signal_array[i - 2], signal_array[i - 3]]
        return i + 1 if quartet.uniq.size == 4
      end
      nil
    end

    def part1
      find_start_marker
    end

    def part2;
    end
  end
end
