months = { january: 31,
           February: 28,
           March: 31,
           April: 30,
           May: 31,
           June: 30,
           July: 31,
           August: 31,
           September: 30,
           October: 31,
           November: 30,
           December: 31 }

months_30 = []
months.each do |month_name, days|
  if days == 30
      months_30 << month_name
  end
end

puts months_30