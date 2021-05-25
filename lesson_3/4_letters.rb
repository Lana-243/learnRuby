abc = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u']

abc_hash = Hash.new
k=1
abc.each { |letter| 
    abc_hash[letter] = k
    if vowels.include? letter.to_s == false
     abc_hash.delete[letter]
    end
    k += 1
}

puts abc_hash
