puts 'What is the base?'
base = gets.chomp

puts 'What is the height?'
height = gets.chomp

area = (base.to_i * height.to_i) / 2.round(2)

puts area
