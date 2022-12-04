module Day2
  class Main
    attr_accessor :strategy_guide

    def initialize(input)
      @strategy_guide = input.split("\n")
    end

    def get_hand
      new_hands = []
      strategy_guide.each do |hand|
        new_hand = if hand == "A Z" then "A Y"
                elsif hand == "A Y" then "A X"
                elsif hand == "A X" then "A Z"
                elsif hand == "B Z" then "B Z"
                elsif hand == "B Y" then "B Y"
                elsif hand == "B X" then "B X"
                elsif hand == "C Z" then "C X"
                elsif hand == "C Y" then "C Z"
                elsif hand == "C X" then "C Y"
                end
        new_hands.push(new_hand)
      end
      new_hands
    end

    def get_hand_scores(guide = strategy_guide)
      scores = []
      guide.each do |hand|
        score = if hand == "A Z" then 3
                elsif hand == "A Y" then 2 + 6
                elsif hand == "A X" then 1 + 3
                elsif hand == "B Z" then 3 + 6
                elsif hand == "B Y" then 2 + 3
                elsif hand == "B X" then 1
                elsif hand == "C Z" then 3 + 3
                elsif hand == "C Y" then 2
                elsif hand == "C X" then 1 + 6
                end
        scores.push(score)
      end
      scores
    end

    def part1
      get_hand_scores.sum
    end

    def part2
      guide = get_hand
      get_hand_scores(guide).sum
    end
  end
end
