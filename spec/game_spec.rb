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

  it "plays a gutter game" do
    roll_many(20, 0)  

    expect(game.score).to eql 0
  end
  
  it "plays an all ones game" do
    roll_many(20, 1)
    
    expect(game.score).to eql 20
  end
  
  it "plays one spare game" do
    roll_spare
    game.roll(3)
    roll_many(17, 0)
    
    expect(game.score).to eql 16
  end
  
  it "plays one strike game" do
    roll_strike
    game.roll(3)
    game.roll(4)
    roll_many(16, 0)

    expect(game.score).to eql 24
  end
  
  it "plays a perfect game" do
    roll_many(12, 10)

    expect(game.score).to eql 300
  end
end
