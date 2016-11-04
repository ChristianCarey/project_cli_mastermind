describe Player do 
  
  let(:board){ double("board") }
  let(:player){ Player.new(board) }

  it "should be a Player" do 
    expect(player).to be_a(Player)
  end
end