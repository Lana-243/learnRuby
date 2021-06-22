require_relative 'train_passenger.rb'
class Station < RailRoad

  attr_reader :trains, :name
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
      @@stations << name
  end
  
  def add_train(train)
    add_train!(train) if add_train?(train)
  end
  
  def train_leaving(train)
    @trains.delete(train) if @trains.include?(train)
  end
  
  def trains_list
    @trains.map(&:train).join(', ')
  end
  
  def all_objects
  end

  private
#shows actions inside the methods
  def add_train!(train)
    @trains << train
  end
  
  def add_train?(train)
   false if @trains.include? train
   
  end
end



