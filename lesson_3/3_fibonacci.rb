feb_seq = [0, 1]
while (k = feb_seq[-1] + feb_seq[-2]) < 100 do
  feb_seq << k
end

puts feb_seq
