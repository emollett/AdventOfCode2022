module Day8
  class Main
    attr_accessor :trees, :rotated_trees

    def initialize(input)
      @trees = input.split("\n").map{|a| a.split("")}
      @rotated_trees = trees.dup.transpose
    end

    def count_exterior
      (trees.size + trees[0].size - 2)*2
    end

    def count_interior
      count = 0
      trees[1..-2].each_with_index do |row, j|
        row[1..-2].each_with_index do |tree, i|
          left = row[0..i+1]
          right = row[i+1..-1]
          up = rotated_trees[i+1][0..j+1]
          down = rotated_trees[i+1][j+1..-1]
          if (tree == left.max && left.count(left.max) == 1) || (tree == right.max && right.count(right.max) == 1) || (tree == down.max && down.count(down.max) == 1) || (tree == up.max && up.count(up.max) == 1) 
            count += 1 
          end
        end
      end
      count
    end

    def scenic_scores
    scores = []
    trees[1..-2].each_with_index do |row, j|
      row[1..-2].each_with_index do |tree, i|
        left = row[0..i]
        right = row[i+2..-1]
        up = rotated_trees[i+1][0..j]
        down = rotated_trees[i+1][j+2..-1]
        
        left_score = (i+1) - (left.rindex{|l| l >= tree} || 0)
        right_score = right.find_index{|r| r >= tree} ? right.find_index{|r| r >= tree} + 1 : row.size - (i+2)
        up_score = (j+1) - (up.rindex{|u| u >= tree} || 0)
        down_score = down.find_index{|d| d >= tree} ? down.find_index{|d| d >= tree} + 1: rotated_trees.size - (j+2)
        scores.push(left_score*right_score*up_score*down_score)
      end
    end
    scores
    end

    def part1
      count_exterior + count_interior
    end

    def part2
      scores = scenic_scores
      scores.max
    end
  end
end
