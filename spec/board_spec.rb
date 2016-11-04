describe Board do 


  it "should have no code to start out" do 
    expect(subject.code).to be_nil
  end

  describe "#render" do 

    it "should have to Renderer contruct the board" do 
      expect(Renderer).to receive(:render_board)
      subject.render
    end
  end
end