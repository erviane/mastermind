class Mastermind

	def init(repeat)
		if repeat == "Y"
			@x = 4.times.map{Random.rand(1..10)}
		else
			@x = (1..10).to_a.sample(4)
		end
		board
	end

	def board
		@board = Array.new(10) { Array.new(4, " ") }
		@count = Array.new(10, " ")
		display_board
		play
	end

	def display_board
		puts "==========================="
		puts "======  MATERMIND  ========"
		puts "==========================="
		puts "                           "
		puts "  -  |  -  |  -  |  - "
		puts "-------------------------"
		for i in 0..9
			puts " #{@board[i][0]}  |  #{@board[i][1]}  |  #{@board[i][2]}  |  #{@board[i][3]}   ||   #{@count[i]}"
			puts "---------------------"
		end
		puts "                           "
		puts "==========================="
	end

	def display_hint
		puts "=========================="
		puts "======= MATERMIND  ======="
		puts "====  FINAL RESULT  ======"
		puts "=========================="
		puts "                          "
		puts "  #{@x[0]}  |  #{@x[1]}  |  #{@x[2]}  |  #{@x[3]}"
		puts "-------------------------"
		for i in 0..9
			puts " #{@board[i][0]}  |  #{@board[i][1]}  |  #{@board[i][2]}  |  #{@board[i][3]}   ||   #{@count[i]}"
			puts "---------------------"
		end
		puts "                          "
		puts "=========================="
	end

	def turn
		try = 10-@i
		puts "Try - #{try}\nInput 1-10"
		j=0
		while j<4			
			puts "Num #{j+1} : "
			num = gets.chomp.to_i
			if num.between?(1,10)
				@board[@i][j] = num
				j += 1
			else
				puts "Invalid input. Input 1-10"
			end
		end
		@count[@i] = 0
		for y in 0..3
			@count[@i] += 1 if @board[@i][y] == @x[y]
		end
	end

	def won
		@count.include?4
	end

	def lose
		@i<0 && !won
	end

	def over
		won || lose
	end

	def play
		@i = 9
		while !over
			turn
			display_board
			@i -= 1
		end
		if lose
			display_hint
			puts "Game Over, You Lose"
		end
		if won
			display_hint
			puts "You Won"
		end
	end

end


puts "MASTERMIND GAME"
puts "Wanna play with repetiton?(Y/N)"
repeat = gets.chomp.upcase
master = Mastermind.new.init(repeat) 
