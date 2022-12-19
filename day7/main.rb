module Day7
  class Main
    attr_accessor :directory_contents, :directory_stack, :file_size_stack, :complete_directory_sizes

    def initialize(input)
      @directory_contents = input.split("\n")
      @directory_stack = []
      @file_size_stack = []
      @complete_directory_sizes = []
    end

    def scan_directory
      directory_contents.each do |line|
        if line.include?('$ cd ..')
          directory_stack.pop
          complete_directory_sizes.push(file_size_stack.pop)
        elsif line.include?('$ cd')
          directory_stack.push(line)
          file_size_stack.push(0)
        end
        next unless Integer(line.split[0], exception: false)

        file_size = line.split[0].to_i
        file_size_stack.map! { |s| s + file_size }
      end
      (complete_directory_sizes << file_size_stack).flatten!
    end

    def part1
      scan_directory
      total = 0
      complete_directory_sizes.each do |size|
        total += size if size <= 100_000
      end
      total
    end

    def part2
      nil
    end
  end
end
