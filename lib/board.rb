require_relative 'square'

class Board

  def initialize
    create_board
  end

  def create_board
    @board_hash = Hash.new
    vertex = 1
    row = 1
    while row < 9
      column = 1
      square_array = []
      while column < 9
        square = Square.new(column, row, vertex, @board_hash)
        square_array.push(square)
        column += 1
        vertex += 1
      end
      @board_hash[:"row_#{row}"] = square_array
      row += 1
    end
  end
end
