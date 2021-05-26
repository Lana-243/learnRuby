abc = ('a'..'z')
vowels = ['a', 'e', 'i', 'o', 'u']

vowels_hash = Hash.new
k=1
abc.each { |letter| 
    if (vowels.include? letter ) == true
        vowels_hash[letter]=k
    end
    k += 1
}

puts vowels_hash
