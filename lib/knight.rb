require_relative 'board'
require_relative 'square'

class Knight
  def initialize(board)
    @board = board
  end

  def knight_moves(start, finish, current_path = [], shortest_path = [])
    start = @board.find(start) unless start.instance_of? Square
    finish = @board.find(finish) unless finish.instance_of? Square
    queue = [start]
    explored = []
    until queue.length == 0 do
      queue.each do |node|
        current_square = queue[0]
        if current_square == finish
          recent_square = current_square
          until recent_square.nil?
            current_path.unshift(recent_square)
            recent_square = recent_square.parent
          end
          shortest_path = current_path if shortest_path.empty? || current_path.length < shortest_path.length
        end
        current_square.direct_moves.values.each do |value|
          next if value.nil?
          next if explored.include?(value) || queue.include?(value)
          queue.push(value)
          value == start ? value.parent = nil : value.parent = current_square
        end
        explored.push(current_square)
        queue.shift
      end
    end
    puts "Shortest Path: #{shortest_path.map { |v| v.coordinates }}"
  end
end
