class Square
  attr_accessor :coordinates, :vertex, :direct_links

  def initialize(x, y, vertex, board)
    @x = x
    @y = y
    @coordinates = [x, y]
    @vertex = vertex
    @@board = board
  end

  def direct_moves
    @direct_links = {
      move_1: @@board.values.map { |values| values.select { |value| value.coordinates == [@x + 1, @y + 2] } }.flatten[0],
      move_2: @@board.values.map { |values| values.select { |value| value.coordinates == [@x + 2, @y + 1] } }.flatten[0],
      move_3: @@board.values.map { |values| values.select { |value| value.coordinates == [@x + 2, @y - 1] } }.flatten[0],
      move_4: @@board.values.map { |values| values.select { |value| value.coordinates == [@x + 1, @y - 2] } }.flatten[0],
      move_5: @@board.values.map { |values| values.select { |value| value.coordinates == [@x - 1, @y - 2] } }.flatten[0],
      move_6: @@board.values.map { |values| values.select { |value| value.coordinates == [@x - 2, @y - 1] } }.flatten[0],
      move_7: @@board.values.map { |values| values.select { |value| value.coordinates == [@x - 2, @y + 1] } }.flatten[0],
      move_8: @@board.values.map { |values| values.select { |value| value.coordinates == [@x - 1, @y + 2] } }.flatten[0]
    }
  end
end