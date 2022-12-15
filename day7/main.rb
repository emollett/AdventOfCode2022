module Day7
  class Main
    attr_accessor :directory_contents, :directories

    def initialize(input)
      @directory_contents = input.split("$ cd").map{ |a| a.split("\n")}
      @directories = input.split("\n").select{ |line| line.include? "dir"}
    end

    def get_size_of_directory(directory)
      name = directory.split(" ")[1]
      contents = directory_contents.select{ |directory| directory[0] == " " + name}
      file_sizes = 0
      sub_directories = []
      contents[0].each do |content|
        if Integer(content[0], exception: false)
          file_sizes += content.split(" ")[0].to_i
        end
        if content.split(" ")[0] == "dir"
          sub_directories.push(content)
        end  
      end
      if directories.size > 0
        sub_directories.each do |sub_directory|
          file_sizes += get_size_of_directory(sub_directory)
        end
      else  
        return file_sizes
      end
      file_sizes
    end

    def calculate_all_directories
      all_sizes = []
      directories.unshift('dir /')
      directories.each do |directory|
        all_sizes.push(get_size_of_directory(directory))
        directory_contents.select{ |content| content[0] == " " + directory.split(" ")[1]}[0][0].sub(directory.split(" ")[1], "")
      end
      all_sizes
    end

    def part1
      sizes = calculate_all_directories
      total = 0
      sizes.each do |size|
        total += size if size <= 100000 
      end
      total
    end

    def part2
      nil
    end
  end
end
