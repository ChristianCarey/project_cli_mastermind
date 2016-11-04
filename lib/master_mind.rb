class Mastermind
	CHOICES = %w(A B C D E F)

	def initialize
		@board = Board.new
	end

	def play
    Renderer.welcome
    role = get_player_role
    set_players(role)
		@board.code = @code_maker.get_input
		loop do
			@board.render
			@board.add_choice(@code_breaker.get_input)
			if game_over?
				end_game
				break 
			end 
		end
	end 

	private

		def get_player_role
			Renderer.ask_for_role
			loop do 
	      input = gets.strip.downcase

	      if valid_input?(input)
	        return input
	      end
	      Renderer.invalid_role_input_error
	    end
		end

		def set_players(role)
			if role == 'b'
				@code_maker = ComputerPlayer.new(@board)
				@code_breaker = HumanPlayer.new(@board)
			else
				@code_maker = HumanPlayer.new(@board)
				@code_breaker = ComputerPlayer.new(@board)
			end
		end

		def valid_input?(input)
			input == 'b' || input == 'm'
		end

		def game_over?
			victory? || loss?
		end

		def victory?
			@board.code_guessed?
		end

		def loss?
			@board.full?
		end

	  def end_game
	    @board.render
	    victory? ? Renderer.victory_message : Renderer.loss_message
	  end
end













