
require_relative 'connect_four'
require 'test/unit'
 
class TestGame < Test::Unit::TestCase

def setup
	@board = Board.new(6,7)
end


def test_solved_emptyboard
   @board.drop_piece(Player.new(Player::WHITE),3)
   assert_equal(false, @board.solved?(3,5) )	
end

def test_solved_solved_board
   @board.drop_piece(Player.new(Player::WHITE),0)
   @board.drop_piece(Player.new(Player::WHITE),1)
   @board.drop_piece(Player.new(Player::WHITE),3)
   @board.drop_piece(Player.new(Player::WHITE),2)
   assert_equal(true, @board.solved?(2,5) )	
end

def test_diagonal_win
   @board.drop_piece(Player.new(Player::WHITE),0)
   @board.drop_piece(Player.new(Player::BLACK),1)
   @board.drop_piece(Player.new(Player::WHITE),1)
   @board.drop_piece(Player.new(Player::BLACK),2)
   @board.drop_piece(Player.new(Player::BLACK),2)
   @board.drop_piece(Player.new(Player::WHITE),2)
   @board.drop_piece(Player.new(Player::BLACK),3)
   @board.drop_piece(Player.new(Player::BLACK),3)
   @board.drop_piece(Player.new(Player::BLACK),3)
   @board.drop_piece(Player.new(Player::WHITE),3)
   assert_equal(true, @board.solved?(3,2) )	
end

end




