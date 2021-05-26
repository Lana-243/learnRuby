shopping_cart = {}
shopping_cart_sum = {}
sc_sum = 0

loop do
  puts 'What is material name?'
  puts 'To finish please type -stop-'
  material = gets.chomp

  break if material == 'stop'

  puts 'What is material quantity?'
  quantity = gets.chomp.to_f

  puts 'What is material price?'
  price = gets.chomp.to_f

  shopping_cart[material] = { price: price, quantity: quantity }
  if shopping_cart_sum[material].nil?
    shopping_cart_sum[material] = quantity * price
  else
    shopping_cart_sum[material] += quantity * price
  end
  sc_sum += quantity * price
end

puts shopping_cart
puts shopping_cart_sum
puts "Final sum: #{sc_sum}"
