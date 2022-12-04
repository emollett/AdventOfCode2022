module Day2
  class Main
    attr_accessor :strategy_guide

    def initialize(input)
      @strategy_guide = input.split("\n")
    end

    def get_hand
      new_hands = []
      strategy_guide.each do |hand|
        new_hand = case hand
                   when 'A Z' then 'A Y'
                   when 'A Y' then 'A X'
                   when 'A X' then 'A Z'
                   when 'B Z' then 'B Z'
                   when 'B Y' then 'B Y'
                   when 'B X' then 'B X'
                   when 'C Z' then 'C X'
                   when 'C Y' then 'C Z'
                   when 'C X' then 'C Y'
                   end
        new_hands.push(new_hand)
      end
      new_hands
    end

    def get_hand_scores(guide = strategy_guide)
      scores = []
      guide.each do |hand|
        score = case hand
                when 'A Z' then 3
                when 'A Y' then 2 + 6
                when 'A X' then 1 + 3
                when 'B Z' then 3 + 6
                when 'B Y' then 2 + 3
                when 'B X' then 1
                when 'C Z' then 3 + 3
                when 'C Y' then 2
                when 'C X' then 1 + 6
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
