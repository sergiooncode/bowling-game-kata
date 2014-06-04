require 'game'

describe Game do
  let(:game){ described_class.new }
  
  def roll_many(n, pins)
    n.times { game.roll(pins) }
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
    game.roll(5)
    game.roll(5)
    game.roll(3)
    roll_many(17, 0)
    expect(game.score).to eql 16
  end
end
