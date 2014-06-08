class Game
  attr_accessor :rolls, :current_roll

  def initialize
    @rolls = Array.new(21)
    (0..20).each do |i|
      @rolls[i] = 0
    end
    @current_roll = 0
  end

  def roll(pins)
    @rolls[current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    frame_index = 0
    (0..9).each do |frame|
      if strike?(frame_index)
        score += 10 + strike_bonus(frame_index)
        frame_index += 1
      else
        if spare?(frame_index)
          score += 10 + spare_bonus(frame_index)
          frame_index += 2
        else
          score += sum_of_balls_in_frame(frame_index)
          frame_index += 2
        end
      end
    end
    score
  end

  def strike?(frame_index)
    rolls[frame_index] == 10
  end

  def sum_of_balls_in_frame(frame_index)
    rolls[frame_index] + rolls[frame_index + 1]
  end

  def spare_bonus(frame_index)
    rolls[frame_index + 2]
  end

  def strike_bonus(frame_index)
    rolls[frame_index + 1] + rolls[frame_index + 2]
  end

  def spare?(frame_index) 
    rolls[frame_index] + rolls[frame_index + 1] == 10
  end
end
