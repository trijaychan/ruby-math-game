require "./classes.rb"

game = Game.new

while !game.finished?
  game.question
end

puts "----- GAME OVER -----"
puts "Good bye!"