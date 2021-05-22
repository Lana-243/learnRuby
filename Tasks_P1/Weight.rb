puts "What is your name?"
name=gets.chomp

puts "What is your height?"
height=gets.chomp
perf_weight=(height.to_i-110)*1.15

if perf_weight>0 
    puts "#{name.capitalize!}, your perfect weight is #{perf_weight.round}"
else
    puts "Your weight is optimal alerady"
end 