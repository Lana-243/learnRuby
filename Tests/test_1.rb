class Test2
  attr_reader :ttt, :number
  
  def initialize(number)
      @number = number
      @ttt = [1, 2]
  end
end

aaa = Test2.new('a')

puts aaa.number
puts aaa.ttt
