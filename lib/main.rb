require_relative 'board'
require_relative 'knight'
require_relative 'square'

def move_setup
  puts 'Hello, The first square is at [1,1] and the last is at [8,8].'
  puts 'Please input the x coordinate of the square you wish to start from!'
  start_x = gets.chomp.to_i
  puts 'Now the y coordinate!'
  start_y = gets.chomp.to_i
  start = [start_x, start_y]
  puts 'Now please input the x coordinate of the square you wish to end at!'
  ending_x = gets.chomp.to_i
  puts 'And the y coordinate of the end square!'
  ending_y = gets.chomp.to_i
  ending = [ending_x, ending_y]
  possible_coords?([start, ending]) ? Board.new.knight_piece.knight_moves(start, ending) : [puts('Coordinates not valid!'), greetings]
  sleep(2)
  move_again
end

def move_again
  puts 'Would you like to move again? Y/N'
  answer = gets.chomp
  ['Y', 'y'].include?(answer) ? greetings : return
end

def possible_coords?(coords)
  return false unless coords.flatten.all? { |coord| coord.instance_of? Integer }
  return false unless coords.length == 2
  return false if coords.flatten.any? { |coord| coord < 1 || coord > 8 }

  true
end

move_setup
