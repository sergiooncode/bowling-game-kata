class Game
  attr_reader :rolls, :current_roll

  def initialize
    @rolls = Array.new(21)
    (0..20).each do |i|
      @rolls[i] = 0
    end
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    frame_index = 0
    (0..9).each do |frame|
      if @rolls[frame_index] + @rolls[frame_index + 1] == 10
        score += 10 + @rolls[frame_index + 2]
        frame_index += 2
      else
        score += @rolls[frame_index] + @rolls[frame_index + 1]
        frame_index += 2
      end
    end
    score
  end
end
