months = { 1 => 31,
           2 => 28,
           3 => 31,
           4 => 30,
           5 => 31,
           6 => 30,
           7 => 31,
           8 => 31,
           9 => 30,
           10 => 31,
           11 => 30,
           12 => 31 }

puts 'day?'
day_answ = gets.chomp.to_i

puts 'month?'
month_answ = gets.chomp.to_i

puts 'year?'
year_answ = gets.chomp.to_i

if year_answ % 400 == 0 || (year_answ % 4 == 0) && (year_answ % 100 != 0)
  months[2] = 29
end

full_sum = 0
months.each_key do |month_num|
    if month_num <= month_answ && !(month_num == 1)
      full_sum +=  months[month_num]
  end
end

full_sum += day_answ

puts full_sum
