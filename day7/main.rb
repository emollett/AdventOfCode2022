module Day7
  class Main
    attr_accessor :directory_contents, :directories, :directory_info

    def initialize(input)
      @directory_contents = input.split("$ cd").map{ |a| a.split("\n")}
      @directories = input.split("\n").select{ |line| line.include? "dir"}
      @directory_info = {}
    end

    def add_files
      directories.reverse.each do |directory|
        name = directory.split(" ")[1]
        contents = directory_contents.select{ |directory| directory[0] == " " + name}
        file_sizes = 0
        directories = []
        contents[0].each do |content|
          if Integer(content[0], exception: false)
            file_sizes += content.split(" ")[0].to_i
          end
          if content.split(" ")[0] == "dir"
            directories.push(content)
          end  
        end
        # this is overwriting the info for an identically named directory
        directory_info[directory] = {file_sizes: file_sizes, inner_directories: directories}
      end
      directory_info
    end

    def add_inner_directory_sizes
      directories.reverse.each do |directory_name|
        directory_info[directory_name][:inner_directories].each do |d|
          inner_directory_size = directory_info[d][:file_sizes]
          directory_info[directory_name][:file_sizes] += inner_directory_size
        end
      end
      directory_inffo
    end

    def part1
      add_files
      add_inner_directory_sizes
      total = 0
      directory_inffo.each do |key, directory|
        total += directory[:file_sizes] if directory[:file_sizes] <= 100000 
      end
      total
    end

    def part2
      nil
    end
  end
end
