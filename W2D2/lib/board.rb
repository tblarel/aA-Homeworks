require_relative "player.rb"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1,1)
    @player2 = Player.new(name2,2)
    @cups = Array.new(14) { Array.new }
    @cups = self.place_stones
    @current_player_name = @player1.name
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    i = 0
    while i < @cups.length
      (0..3).each do |b|
       @cups[i] << :stone if i != 6 && i != 13
      end
      i += 1
    end
    return @cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 
    raise "Starting cup is empty" if @cups[start_pos].length == 0
    return true
  end

  def make_move(start_pos, current_player_name)
    @current_player_name = current_player_name
    self.render
    if valid_move?(start_pos)
      stones = @cups[start_pos].length
      @cups[start_pos] = Array.new
      #puts "startpos is now #{cups[start_pos]}"
      #puts "adding #{stones} stones to board"
      idx = start_pos+1
      while stones > 0
        #puts "#{stones} stones left to add"
        #puts "checking #{idx}"
        idx = idx % 13
        if idx != 6 && idx != 13
          #puts "#{idx} isnt a store loc"
          @cups[idx] << :stone
          stones -= 1
          #puts "adding a stone at #{idx}. its now #{@cups[idx]}"
          idx += 1
        end
        if  idx == 6 
          if current_player_name == @player1.name
            #puts "#{idx} is store loc1 but player is p1"
            @cups[idx] << :stone
            stones -= 1
            #puts "adding a stone at #{idx}. its now #{@cups[idx]}"
          end
          idx += 1
        end
        if idx == 13 
          if current_player_name == @player2.name
            #puts "#{idx} is store loc2 but player is p2"
            @cups[idx] << :stone
            stones -= 1
            #puts "adding a stone at #{idx}. its now #{@cups[idx]}"
          end
          idx += 1
        end
      end
    end
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
  
    # if ending_cup_idx == @current_player_name
    # if @cups[ending_cup_idx].length > 0 && ending_cup_idx 
    #   make_move(ending_cup_idx,@current_player_name)
    # end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    a = false
    @cups[1..4].each do |cup|
      if cup.length != 0
        return false
      end
    end    
    @cups[7..12].each do |cup|
      if cup.length != 0
        return false
      end
    end
    return true
  end

  def winner
  end
end
