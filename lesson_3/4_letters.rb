abc = ('a'..'z')
vowels = ['a', 'e', 'i', 'o', 'u']

vowels_hash = Hash.new
k=1
abc.each do |letter| 
    if vowels.include? letter
        vowels_hash[letter]=k
    end
    k += 1
end

puts vowels_hash
