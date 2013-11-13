class Game


  def initialize()
    @board = Board.new(6,7)
    @player1 = Player.new(Player::BLACK)
    @player2 = Player.new(Player::WHITE)
  end


  def update
    p "Hello, player 1 takes first turn"
    @board.draw
    [@player1, @player2].cycle { |p|
      begin
        print "Enter a columm >"
        input = gets || exit(0)
        c  = Integer(input.chomp())

        if @board.dropPiece(p,c)
          break
        end
        rescue
         p "Choose an Integer column that isn't Full"
        retry
      end
      @board.draw
    }
    @board.draw
    
    p "Congratulations, Player, you have won"
  end


  


end




class Board
  attr_reader :cols

  DIRECTIONS=[[1,-1],[1,1],[1,0],[0,1]]

  def initialize(r,c)
    @cols = []
    constructBoard(r,c)
  end

  def constructBoard(r,c)
    (0..c).each { |c|
      cols[c] = []
      (0..r).each{ |r|
        cols[c][r] = 0
      }
    }

  end

  def dropPiece(p,c)
    if !colFull?(c)
      i = getNextRow(c)
      cols[c][i] = p.color
      return solved?(c,i)
    else
      raise "Invalid Space"
    end
  end

  def solved?(col,row)
    DIRECTIONS.each { |(dr,dc)|
      count=1
      c,r= col,row
      color= cols[c][r]
      loop  do
        r+= dr
        c+= dc
        break unless cols[c][r]  == color
        count+=1
        return true if count==4
      end
      c,r= col,row
      loop do
        r+= -dr
        c+= -dc
        break unless (cols[c][r] == color)
        count+=1
        return true if count==4

      end
    }
    false
  end
  def colFull?(c)
    cols[c][0] != 0

  end
  def getNextRow(c)
    cols[c].rindex(0)
  end

  def draw
    (0...cols.size).each { |r|
      (0...cols[r].size).each { |c|
        case  cols[c][r]
          when 1 
          	  print 'X'
          when  2
              print 'O'	
           when 0
              print '.'
         end          

      }
      puts
    }


  end


end


class Player
  BLACK=1
  WHITE=2

  attr_reader :color


  def initialize color
    @color = color

  end

end

game = Game.new
game.update