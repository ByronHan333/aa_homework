class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    if !game_over
      show_sequence
      require_sequence
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    h = {'r'=>'red', 'b'=>'blue', 'g'=>'green', 'y'=>'yellow'}

    p self.seq
    puts "Input: "
    input = gets.chomp.split(' ')

    if input[0] == 'q'
      self.game_over = true
    else
      won = input.each_with_index.all?{|v, i| h[v]==self.seq[i]}
      if won
        puts "won!"
      else
        puts "lose!"
      end
    end

  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "this round is over."
  end

  def game_over_message
    puts "game is over!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  s.play
end
