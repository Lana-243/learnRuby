puts "What is coefficient a?"
a=gets.chomp

puts "What is coefficient b?"
b=gets.chomp

puts "What is coefficient c?"
c=gets.chomp

d=b.to_i**2-4*a.to_i*c.to_i

if d>0
    x1=((-1)*b.to_i + Math.sqrt(d.to_i))/(a.to_i*2)
    x2=((-1)*b.to_i - Math.sqrt(d.to_i))/(a.to_i*2)
    puts "Results: Discriminant=#{d}, X1=#{x1.round(2)}, X2=#{x2.round(2)}"
elsif d==0
    x=((-1)*b.to_i)/(a.to_i*2)
    puts "Results: Discriminant=#{d.round(2)}, X=#{x.round(2)}"
else
    puts "Results: No roots, Discriminant=#{d.round(2)}"
end    
