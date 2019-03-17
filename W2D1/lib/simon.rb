class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    self.take_turn
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      self.round_success_message 
      @sequence_length+=1
    end
  end

  def show_sequence
    self.add_random_color
    puts "Watch carefully, here comes the sequence..."
    sleep(1.5)
    system("clear")
    @seq.each do |color|
      puts color
      sleep(1.5)
      system("clear")
      puts "------"
      sleep(0.5)
      system("clear")
    end

  end

  def require_sequence
    puts "Enter the sequence with spaces between colors"
    input = gets.chomp
    input_arr = input.split(" ")
    #puts "input arr is #{input_arr} and required seq is #{seq}"
    @game_over = true if input_arr != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Correct.....for now....adding new color"
  end

  def game_over_message
    correct_seq = seq.join(",")

    puts "Oops, YOU LOSE. Correct sequence was #{correct_seq}. \n Resetting game..."

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new

game.play