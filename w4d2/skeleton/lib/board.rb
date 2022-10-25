class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    self.place_stones
    @name1 = name1
    @name2 = name2

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |c,i|
      cups[i] = [:stone, :stone, :stone, :stone] if i != 6 && i != 13
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !start_pos.between?(0, 13)
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    n_stones = cups[start_pos].length
    cups[start_pos] = []

    forbidden_pos = 13 if current_player_name == name1
    forbidden_pos = 6 if current_player_name == name2

    while n_stones > 0
      start_pos = (start_pos+1)%14
      if start_pos != forbidden_pos
        cups[start_pos] << :stone
        n_stones -= 1
      end
    end
    render
    # next_turn(start_pos, current_player_name)
    next_turn(start_pos)
  end

  # problem is here
  # def next_turn(ending_cup_idx, current_player_name)
  #   # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  #   if cups[ending_cup_idx].empty?
  #     return :switch
  #   elsif ending_cup_idx == 6 && current_player_name = name1
  #     return :prompt
  #   elsif ending_cup_idx == 13 && current_player_name = name2
  #     return :prompt
  #   elsif !cups[ending_cup_idx].empty?
  #     return ending_cup_idx
  #   end
  # end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on store -- get to choose where to start again
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # ended on empty cup -- switches players' turns
      :switch
    else
      # ended on cup with stones in it -- automatically starts there
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1_empty = true
    (0..5).each {|i| side1_empty = false if !cups[i].empty?}
    side2_empty = true
    (7..12).each {|i| side2_empty = false if !cups[i].empty?}
    return true if side1_empty || side2_empty
    false
  end

  def winner
    return :draw if cups[6] == cups[13] && cups[6].length == 6
    if cups[6].length == 6
      return name1
    elsif cups[13].length == 6
      return name2
    end
  end
end
