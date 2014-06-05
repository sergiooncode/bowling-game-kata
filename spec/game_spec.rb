require 'game'

describe Game do
  let(:game){ described_class.new }
  
  def roll_many(n, pins)
    n.times { game.roll(pins) }
  end
  
  def roll_spare
    2.times { game.roll(5) }
  end

  def roll_strike
    game.roll(10)
  end

  it "tests gutter game" do
    roll_many(20, 0)  

    expect(game.score).to eql 0
  end
  it "tests all ones game" do
    roll_many(20, 1)
    
    expect(game.score).to eql 20
  end
  it "tests one spare game" do
    roll_spare
    game.roll(3)
    roll_many(17, 0)
    
    expect(game.score).to eql 16
  end
  it "tests one strike game" do
    roll_strike
    game.roll(3)
    game.roll(4)
    roll_many(16, 0)

    expect(game.score).to eql 24
  end
end
