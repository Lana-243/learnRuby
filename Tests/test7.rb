# begin
#   puts 'Before exception'
#   Math.sqrt(-1)
# rescue StandardError => e
#   puts "Error!!!"
#   raise
# rescue NoMemoryError =>e
#   puts "No memory!!!"
# end

# puts 'After exception'

def method_with_error
  #...
  raise "Oh no!"
end

begin
  method_with_error
rescue RuntimeError => e
  puts e.inspect
end

puts 'After exception'