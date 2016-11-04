describe ComputerPlayer do 

  let(:board){ double("board")}
  let(:player){ ComputerPlayer.new(board) }

  describe '#get_input' do 

    it "should return an array" do
      expect(player.get_input).to be_an(Array)
    end

    it "will only return values that are valid color choices" do 
      expect(player.get_input.all? do 
        |choice| %w(A B C D E F).include?(choice)
      end).to be true
    end

    it "will return four values" do 
      expect(player.get_input.length).to eq(4)
    end
  end
end