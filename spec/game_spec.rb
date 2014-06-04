require 'game'

describe Game do
  let(:game){ described_class.new }
  it "tests gutter game" do
    20.times { game.roll(0) }

    expect(game.score).to eql 0
  end
end
