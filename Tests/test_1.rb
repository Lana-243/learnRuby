# class Test2
#   attr_reader :ttt, :number
  
#   def initialize(number)
#       @number = number
#       @ttt = [1, 2]
#   end
# end

# aaa = Test2.new('a')

# puts aaa.number
# puts aaa.ttt

# def check(a, b)
#   train =! a.find{ |tr| tr.name == train}
# end  

# class Dogs
  
#   def initialize
#     puts 'Good boy'
#   end
# end

class Route1
  
  @@trains = []
  attr_accessor :trains
  
end

class TrainsTest < Route1
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def self.check(train_name)
    train_name == @@trains.find{ |tr| tr.name == train_name}
  end  
  
  def self.train_create(name)
    @@trains << self.new(name)
  end  
  
  def self.show_trains
    @@trains
  end
end
 
rr = Route1.new('rrr')

puts rr.class

# tr1 = TrainsTest.train_create('tr11')

# tr3 = TrainsTest.new('tr33')

# a = tr1.check('tr11')



# puts tr1.name

