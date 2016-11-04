describe HumanPlayer do 

  let(:board){ double("board") }
  let(:player){ HumanPlayer.new(board) }
  
  it "should inherit from Player" do 
    expect(player.class.superclass).to eq(Player)
  end

  describe '#get_input' do 

    it "should return valid input as an array" do 
      allow(player).to receive(:gets).and_return('ABCD')
      allow(player).to receive(:puts)
      expect(player.get_input).to eq(%w(A B C D))
    end

    it "should ask the renderer for an invalid input error when given invalid input" do 
      allow(player).to receive(:puts)
      allow(player).to receive(:gets).and_return("wrong", "wrong again","ABCD")
      allow(Renderer).to receive(:invalid_input_error)
      expect(Renderer).to receive(:invalid_input_error).exactly(:twice)
      player.get_input
    end
  end
end