puts "What is side a side?"
a=gets.chomp

puts "What is side b side?"
b=gets.chomp

puts "What is side c side?"
c=gets.chomp

no_tr_type=true

if a>b && a>c
    longest=a
    if b.to_i**2+c.to_i**2==a.to_i**2
        if b==c
            puts "This triangle is Right and Isosceles"   
            no_tr_type=false
        else
            #прямоугольный
            puts "This triangle is Right"     
            no_tr_type=false
        end
    elsif b==c
        #равнобедренный
        puts "This triangle is Isosceles"    
        no_tr_type=false
    end     
elsif b>a && b>c
    longest = b
    if a.to_i**2+c.to_i**2==b.to_i**2
        if a==c
            puts "This triangle is Right and Isosceles"   
            no_tr_type=false
        else
            #прямоугольный
            puts "This triangle is Right"     
            no_tr_type=false
        end
    elsif a==c
        #равнобедренный
        puts "This triangle is Isosceles"  
        no_tr_type=false
    end     
elsif
    c>a && c>b
    longest=c
    if a.to_i**2+b.to_i**2==c.to_i**2
        if a==b
            puts "This triangle is Right and Isosceles"   
            no_tr_type=false
        else
            #прямоугольный
            puts "This triangle is Right"     
            no_tr_type=false
        end
    elsif a==b
        #равнобедренный
        puts "This triangle is Isosceles"   
        no_tr_type=false
    else
    end     
end

if longest==nil 
    #равносторонний
    puts "This triangle is Equilateral"
    no_tr_type=false
end

if no_tr_type==true
    puts "This triangle is not Right, Isosceles or Equilateral"
end
