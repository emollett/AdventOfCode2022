module Day2
  class Main
    attr_accessor :strategy_guide

    def initialize(input)
      @strategy_guide = input.split("\n").map do |s|
        s.gsub(/[ABCXYZ]/, 'A' => 1, 'X' => 1, 'B' => 2, 'Y' => 2, 'C' => 3, 'Z' => 3)
      end
    end

    def get_hand_scores
      scores = []
      strategy_guide.each do |hand|
        hand = hand.split.map(&:to_i)
        score = if hand[0] == 1 && hand[1] == 3 then hand[1]
                elsif hand[0] == 3 && hand[1] == 1 then hand[1] + 6
                elsif hand[0] > hand[1] then hand[1]
                elsif hand[0] < hand[1] then hand[1] + 6
                else hand[1] + 3
                end
        scores.push(score)
      end
      scores
    end

    def part1
      get_hand_scores.sum
    end

    def part2;    end
  end
end
